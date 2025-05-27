import 'package:project_one/librarySystem/services/implementations/book_service.dart';

import 'controller/library.dart';
import 'services/implementations/book_service.dart';

// view
void main() {
  BookService testing = BookService([]);
  Library ok = Library(testing);

  ok.initLib(
    '../project_one/lib/librarySystem/database/lib_db.json'
  );

  ok.showStats();

}
