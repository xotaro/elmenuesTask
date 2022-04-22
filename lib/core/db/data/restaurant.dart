import 'package:floor/floor.dart';
import '';
import '../../domain/restaurant.dart'as Model;
@entity
class Restaurant {
  @primaryKey
  final String name;
  final String imagesPath;
  final String imagesPath1;
  final String imagesPath2;
  final String imagesPath3;
  final String logoPath;
  final int deliveryTime;
  final String? offer;
  final bool online;
  final String tags;
  final double rating;
  final bool offerOn;


  Restaurant(
      this.name,
      this.logoPath,
      this.deliveryTime,
      this.offer,
      this.online,
      this.imagesPath,
      this.imagesPath1,
      this.imagesPath2,
      this.imagesPath3, this.tags, this.rating, this.offerOn);

  factory Restaurant.fromModel(Model.Restaurant restaurant) {
    return Restaurant(
        restaurant.name,
        restaurant.logoPath,
        restaurant.deliveryTime,
        restaurant.offer,
        restaurant.online,
        restaurant.imagesPath,
        restaurant.imagesPath1,
        restaurant.imagesPath2,
        restaurant.imagesPath3,
        restaurant.tags.join(","),
        restaurant.rating,
        restaurant.offerOn,

    );
  }
  Model.Restaurant toModel() {
    return Model.Restaurant(
      rating: rating,
      name:name,
      deliveryTime: deliveryTime,
      imagesPath1: imagesPath1,
      imagesPath2: imagesPath2,
      imagesPath3: imagesPath3,
      imagesPath: imagesPath,
      logoPath: logoPath,
      online: online,
      tags: tags.split(","),
      offer: offer,
      offerOn: offerOn
    );
  }
}
