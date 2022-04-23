import 'package:elmenues/core/repository/db_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../core/domain/restaurant.dart' as Model;

@injectable
class HomeViewModel extends ChangeNotifier {
  List<Model.Restaurant> restaurants = [];
  List<Model.Restaurant> restaurantsOffers = [];
  bool switcher=true;
  DbRepository _dbRepository;
  HomeViewModel(this._dbRepository){
    getAllRestaurants();
    getRestaurantOffers();
  }
  void setSwitcher(bool x){
    switcher=x;
    notifyListeners();
  }
  void getAllRestaurants() {
    _dbRepository.getAllRestaurants().then((value) {
      restaurants = value;
      notifyListeners();
    });
  }
  void getRestaurantOffers() {
    _dbRepository.getOffers().then((value) {
      restaurantsOffers = value;
      notifyListeners();
    });
  }
}
