import 'package:injectable/injectable.dart';

import '../db/db.dart';


@module
abstract class RegisterModule {

  @preResolve
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder('Remotify.db').build();
}
