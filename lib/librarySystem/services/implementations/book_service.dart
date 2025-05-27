import 'dart:convert';
import 'dart:io';
import 'package:project_one/librarySystem/services/interface/i_book_service.dart';
import '../../model/book.dart';
import 'package:collection/collection.dart';

class BookService implements IBookService {
  List<Book> books;

  BookService(this.books);

  @override
  void loadFromJson(String path) {
    final file = File(path);
    final contents = file.readAsStringSync();
    final List<dynamic> jsonList = jsonDecode(contents);

    for (var item in jsonList) {
      print("${item['id']} ${item['title']} is added.");
      books.add(Book.fromJson(item));
    }
  }

  // bool checkExist(int id) => books.any((book) => book.id == id);
  @override
  Book? findByID(int id) => books.firstWhereOrNull((book) => book.id == id);

  @override
  List<Book> getAllBooks() => books;

  @override
  List<Book> findByTitle(String title) =>
      books
          .where(
            (books) => books.title.toLowerCase().contains(title.toLowerCase()),
          )
          .toList();

  @override
  List<Book> findByAuthor(String author) =>
      books
          .where(
            (books) =>
                books.author.toLowerCase().contains(author.toLowerCase()),
          )
          .toList();

  @override
  List<Book> findBorrowedBooks() =>
      books.where((book) => book.isBorrowed == true).toList();

  @override
  List<Book> findOverdueBooks() =>
      books
          .where((book) => (book.dueDate?.isBefore(DateTime.now()) ?? false))
          .toList();

  @override
  Map<String, dynamic> showDetails(int id) {
    var book = books.firstWhere((book) => book.id == id);
    return {
      'id': book.id,
      'title': book.title,
      'author': book.author,
      'genre': book.genre,
      'isBorrowed': book.isBorrowed,
      'borrower': book.borrower,
      'dueDate': book.dueDate,
    };
  }

  @override
  Map<String, int> genreSummary(books) {
    final Map<String, int> genreCounts = {};

    for (var book in books) {
      genreCounts[book.genre] = (genreCounts[book.genre] ?? 0) + 1;
    }

    return genreCounts;
  }

  @override
  String? findDueStatus(Book book) {
    final now = DateTime.now();
    final due = book.dueDate;

    String? formatDuration(Duration duration) {
      //rounding up extra hours & mins as days
      int days = duration.inDays;
      var a = '';
      if (duration.inMinutes.remainder(1440) > 0) {
        a = '$days day${days > 1 ? "s" : ""}';
      }
      return a;
    }

    bool isSameDate(DateTime a, DateTime b) => // check same date
        a.year == b.year && a.month == b.month && a.day == b.day;

    if (isSameDate(due!, now)) {
      return "Now";
    } else if (due.isBefore(now)) {
      return "Overdue by ${formatDuration(now.difference(due))}";
    } else {
      return "Due on $due";
    }
  }

  @override
  void addBook(String title, String author, String genre) {
    final int id =
        books.isEmpty
            ? 1
            : books.map((b) => b.id).reduce((a, b) => a > b ? a : b) + 1;
    books.add(Book(id, title, author, genre));
  }

  @override
  void deleteBookByID(int id) {
    books.removeWhere((book) => book.id == id);
  }

  @override
  void markAsBorrowed(Book book, String borrower, DateTime due) {
    try {
      book.isBorrowed = true;
      book.borrower = borrower;
      book.dueDate = due;
    } catch (e) {
      print(e);
    }
  }

  @override
  void markAsReturned(Book book) {
    try {
      book.isBorrowed = false;
      book.borrower = "";
      book.dueDate = null;
    } catch (e) {
      print(e);
    }
  }
}
