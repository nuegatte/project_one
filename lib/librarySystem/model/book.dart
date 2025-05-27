//model

class Book {
  final int id;
  final String title;
  final String author;
  final String genre;
  bool isBorrowed;
  String borrower;
  DateTime? dueDate;

  Book(
    this.id,
    this.title,
    this.author,
    this.genre, {
    this.isBorrowed = false,
    this.borrower = "",
    this.dueDate,
  }); //parameter

  factory Book.fromJson(Map<String, dynamic> json) {
    //loading, parsing json files into usable data
    return Book(
      json['id'],
      json['title'],
      json['author'],
      json['genre'],
      isBorrowed: json['isBorrowed'],
      borrower: json['borrower'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    //
    return {
      'id': id,
      'title': title,
      'author': author,
      'genre': genre,
      'isBorrowed': isBorrowed,
      'borrower': borrower,
      'dueDate': dueDate,
    };
  }
}
