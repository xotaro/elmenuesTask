import 'package:floor/floor.dart';

import '../data/restaurant.dart';

@dao
abstract class RestaurantDao {
  @insert
  Future<void> insertDevice(Restaurant restaurant);
  @Query('SELECT * FROM Restaurant')
  Future<List<Restaurant>> findAllRestaurants();

  @Query('SELECT * FROM Restaurant Where offerOn =1')
  Future<List<Restaurant>> findOffers();

  @Query('DELETE FROM Restaurant')
  Future<void> deleteAll();


}
