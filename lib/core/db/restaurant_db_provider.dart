import 'package:injectable/injectable.dart';

import 'data/restaurant.dart';
import 'db.dart';

@injectable
class RestaurantDbProvider{
  AppDatabase _database;
  RestaurantDbProvider(this._database);
  Future<List<Restaurant>> findAllRestaurants(){
    return _database.restaurantDao.findAllRestaurants();
  }
  Future<List<Restaurant>> findOffers(){
    return _database.restaurantDao.findOffers();
  }
  void insertRestaurant(List<Restaurant> restaurants){
    restaurants.forEach((restaurant) {
      _database.restaurantDao.insertDevice(restaurant);
    });
  }
  void deleteAll(){
    _database.restaurantDao.deleteAll();
  }
}