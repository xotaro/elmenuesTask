import 'dart:async';

import 'package:elmenues/core/db/dao/restaurant_dao.dart';
import 'package:floor/floor.dart';

import 'data/restaurant.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'db.g.dart';

@Database(version: 1, entities: [Restaurant])
abstract class AppDatabase extends FloorDatabase {
  RestaurantDao get restaurantDao;
}
