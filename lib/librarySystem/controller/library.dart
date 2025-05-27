import '../model/book.dart';
import '../model/user.dart';
import '../services/interface/i_book_service.dart';
import 'dart:convert';
import 'dart:io';
// controller

class Library {
  final IBookService bookService;

  Library(this.bookService);

  //formatters for IO screen
  void blocker() {
    print('------------------------------------');
  }

  void initLib(String path){
    bookService.loadFromJson(path);
  }

  List<Book> get books => bookService.getAllBooks();




  void showLibrary() {
    blocker();
    print("All books in the library:\n");

    for (var book in books) {
      if (!book.isBorrowed) {
        print(
          "[${book.id}] ${book.title} by ${book.author} [Genre: ${book.genre}] - Avaialble\n",
        );
      } else if (book.isBorrowed) {
        print(
          "[${book.id}] ${book.title} by ${book.author} [Genre: ${book.genre}]  - Borrowed by ${book.borrower}\n",
        );
      }
    }
  }

  void borrowBook(int id, String borrower){
    final book = bookService.findByID(id);
    var now = DateTime.now();
    final due = DateTime(now.day + 7, 12, 0, 0);

    blocker();
    if(book == null){
      print("Book id [$id] does not exist and is not found.");
    } else  {
      if (book.isBorrowed == false){
        bookService.markAsBorrowed(book, borrower, due);
        print("${book.title} is now borrowed to ${book.borrower} until $due.");

      }else{
        print("${book.title} is currently unavailable and borrowed by ${book.borrower}.");
      }

    }

  }

  void returnBook(int id){
    final book = bookService.findByID(id);

    blocker();
    if(book == null){
      print("Book id [$id] does not exist and is not found.");
    } else  {
      if (book.isBorrowed == true){
        bookService.markAsReturned(book);
        print("${book.title} is now returned.");

      }else{
        print("${book.title} is already returned and available to borrow.");
      }

    }

  }

  void showBorrowed(){
     final borrowed = bookService.findBorrowedBooks();
     print("Borrowed books ${borrowed.isEmpty ? "": "(${borrowed.length} book${borrowed.length > 1 ? "s" : ""}) " }: ${borrowed.isEmpty ? "None" : ""}");

     for (Book book in borrowed){
       String? dueStatus = bookService.findDueStatus(book);

       print(
         "[${book.id}] ${book.title} by ${book.author} [Genre: ${book.genre}]  - Borrowed by ${book.borrower} (Due date : $dueStatus)"
       );
     }
  }

  void showOverdueBooks(){
    final overdue = bookService.findOverdueBooks();
    print("Overdue books : ${overdue.length}");

  }

  void showGenreSummary() {
    final summary = bookService.genreSummary(books);
    int maxGenreLength = summary.keys.map((g) => g.length).reduce((a, b) => a > b ? a : b);


    print("Books summary by genre: ");
    summary.forEach((genre, count){
      String genreAligned = genre.padRight(maxGenreLength);
      print("$genreAligned - $count book${count > 1 ? "s" : ""}");

    });

  }

  void showStats(){
    blocker();
    final bookQty = books.length;

    print("Total books : $bookQty\n");
    showBorrowed();

    showOverdueBooks();

    showGenreSummary();

  }


}

