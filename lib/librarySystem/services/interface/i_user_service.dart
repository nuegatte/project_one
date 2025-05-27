import 'package:project_one/librarySystem/model/book.dart';

import '../../model/user.dart';

abstract class IUserService{
  void loadFromJson(String path);

  User? findByUserID(int userID);

  List<User> getAllUsers();

  bool checkLimit(User user);

  bool checkVIP(User user);

  void borrowUserBook(User user, int BookID);

  void returnUserBook(int UserID, int BookID);

  void markAsSuspended(int UserID, DateTime until);

  void deleteUser(User user);
}