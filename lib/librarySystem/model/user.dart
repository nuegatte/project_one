import 'book.dart';

class User{
  final String username;
  final int userID;

  List<Book> borrowedBooks = [];
  bool VIP;
  DateTime? suspension;

  int get borrowLimit => VIP ? 10 : 5;
  int get borrowedQty => borrowedBooks.length;
  bool get suspended => suspension == null ? false : true;
  User(this.username, this.userID, this.borrowedBooks, {this.VIP = false, this.suspension = null});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      json['username'],
      json['userID'],
      json['borrowedBooks'],
      VIP: json['VIP'],
      suspension: json['suspension']
    );

  }

  Map <String , dynamic > toJson(){
    return {
      'username': username,
      'userID': userID,
      'borrowedBooks': borrowedBooks,
      'VIP': VIP,
      'suspension': suspension
    };
  }


  String showMembershipStatus(bool VIP){
    return VIP
      ? "$username is currently a VIP member has has borrowed ${borrowedBooks.length} book${borrowedQty > 1 ?"s": ""}"
      : "$username is currently not a VIP member and has borrowed $borrowedQty book${borrowedQty >1 ? "s": "" }";
  }

  String showUserStatus(bool suspended) {
    return suspended
        ? "$username has been banned until [$suspension]."
        : "$username is currently not suspended.";
  }
}





