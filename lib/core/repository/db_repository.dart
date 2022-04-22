
import 'dart:async';

import 'package:elmenues/core/db/data/restaurant.dart';
import 'package:elmenues/core/db/restaurant_db_provider.dart';
import 'package:elmenues/core/domain/restaurant.dart'as Db;
import 'package:injectable/injectable.dart';
import '../domain/restaurant.dart' as Model;

@injectable
class DbRepository{
  RestaurantDbProvider _dbProvider;
  DbRepository(this._dbProvider);
  Future<List<Model.Restaurant>> getAllRestaurants() async {
    var restaurants= await _dbProvider.findAllRestaurants();
    return restaurants.map((map) => map.toModel()).toList();
  }
  Future<List<Model.Restaurant>> getOffers() async {
    var restaurants= await _dbProvider.findOffers();
    return restaurants.map((map) => map.toModel()).toList();
  }
  void insertAllRestaurants(List<Model.Restaurant> restaurants){
    List<Restaurant> dbrestaurants= restaurants.map((e) => Restaurant.fromModel(e)).toList();
    _dbProvider.insertRestaurant(dbrestaurants);
  }
  void deleteAll(){
    _dbProvider.deleteAll();
  }

}