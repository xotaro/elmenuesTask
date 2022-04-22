import 'package:elmenues/view/home/components/restaurant_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCardDetails extends StatelessWidget {
  // final ImageProvider image;
  // final String restaurantName;
  // final int deliveryTime;
  // final ImageProvider logo;
  // final List<String> tags;
  // final double rating;
  // final String? offer;
  const RestaurantCardDetails({Key? key,
    // required this.image,
    // required this.restaurantName,
    // required this.deliveryTime,
    // required this.logo,
    // required this.tags,
    // required this.rating,
    // this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
          maxRadius: 22,
            backgroundImage: Image.asset('assets/logos/Burger-King-Logo.png').image,
            backgroundColor: Colors.green,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.73,
          ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Burger King")),
                  Row(
                    children: [
                      RatingStars(
                        rating: 3.5,
                      ),
                      Text("3.5 (75k)")
                    ],
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("American, Fast food, Burger, Sandwiches")),
                  Icon(Icons.credit_card)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
