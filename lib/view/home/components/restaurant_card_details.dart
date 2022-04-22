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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
          maxRadius: 22,
            backgroundImage: Image.asset(logo).image,
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
