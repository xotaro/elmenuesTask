import 'package:elmenues/view/home/components/restaurant_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCardDetails extends StatelessWidget {
  final String restaurantName;
  final String logo;
  final List<String> tags;
  final double rating;
  const RestaurantCardDetails({Key? key,
    required this.restaurantName,
    required this.logo,
    required this.tags,
    required this.rating,
    // this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
            maxRadius: 22,
              backgroundImage: Image.asset(logo).image,
              backgroundColor: Colors.green,
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(restaurantName)),
                  Row(
                    children: [
                      RatingStars(
                        rating: rating,
                      ),
                      Text("$rating (75k)")
                    ],
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(tags.join(", "))),
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
