import '../../model/book.dart';

abstract class IBookService {
  void loadFromJson(String path);

  Book? findByID(int id);

  List<Book> getAllBooks();

  List<Book> findByTitle(String title);

  List<Book> findByAuthor(String author);

  List<Book> findBorrowedBooks();

  List<Book> findOverdueBooks();

  Map<String, dynamic> showDetails(int id);

  Map<String, int> genreSummary(List<Book> books);

  String? findDueStatus(Book book);

  void addBook(String title, String author, String genre);

  void deleteBookByID(int id);

  void markAsBorrowed(Book book, String borrower, DateTime due);

  void markAsReturned(Book book);
}
