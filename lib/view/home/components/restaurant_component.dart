import 'package:elmenues/view/home/components/restaurant_details.dart';
import 'package:elmenues/view/home/components/restaurant_offer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantComponent extends StatelessWidget {
  final ImageProvider image;
  final String restaurantName;
  final int deliveryTime;
  final ImageProvider logo;
  final List<String> tags;
  final double rating;
  final String? offer;
  const RestaurantComponent(
      {Key? key,
      required this.image,
      required this.restaurantName,
      required this.deliveryTime,
      required this.logo,
      required this.tags,
      required this.rating,
      this.offer,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ImageDelivery(image: image, deliveryTime: deliveryTime),
          RestaurantDetails(
            restaurantName: restaurantName,
            tags: tags,
            logo: logo,
            rating: rating,
          ),
        offer!=null?
        Padding(
          padding: const EdgeInsets.only(left: 7.5),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: EdgeInsets.all( 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.percent_sharp,
                    size: 20,
                    color: Colors.green[700],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text(
                        offer!,
                        style: TextStyle(color: Colors.green[700])

                    ),
                  )

                ],
              ),
            ),
          ),
        ):Padding(
          padding: const EdgeInsets.all(7.5),
          child: SizedBox(
          ),
        )


      ],
    );
  }
}
