import 'package:elmenues/core/repository/db_repository.dart';
import 'package:injectable/injectable.dart';

import 'core/domain/restaurant.dart';

@injectable
class Populator {
  DbRepository _dbRepository;
  Populator(this._dbRepository);
  void populateData() {
    _dbRepository.deleteAll();
    List<Restaurant> restaurants = [
      Restaurant(
          offerOn: false,
          rating: 3.5,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "Burger King",
          offer: null),
      Restaurant(
          offerOn: true,
          rating: 3.5,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "Pizza Hut",
          offer: "10EGP on Orders above 60EGP"),
      Restaurant(
          offerOn: false,

          rating: 3.5,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "Papa John's",
          offer: null),
      Restaurant(
          offerOn: false,

          rating: 2,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "KFC",
          offer: null),
      Restaurant(
          offerOn: false,

          rating: 5,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "Bazooka",
          offer: null),
      Restaurant(
          offerOn: true,
          rating: 4,
          tags: ["American", "Fast Food", "Burger", "Sandwiches"],
          online: true,
          logoPath: "assets/logos/Burger-King-Logo.png",
          imagesPath: "assets/images/burger.jpeg",
          imagesPath3: "assets/images/burger.jpeg",
          imagesPath2: "assets/images/burger.jpeg",
          imagesPath1: "assets/images/burger.jpeg",
          deliveryTime: 60,
          name: "Test",
    offer: "10EGP on Orders above 60EGP"),
    ];

    _dbRepository.insertAllRestaurants(restaurants);
  }
}
