import 'package:elmenues/view/home/components/restaurant_card_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final bool online;
  final int deliveryTime;
  final String restaurantName;
  final String logo;
  final List<String> tags;
  final double rating;
  const RestaurantCard({
    Key? key,
    required this.imagePath,
    required this.online,
    required this.deliveryTime,
    required this.restaurantName,
    required this.logo,
    required this.tags,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(imagePath),
                Positioned(
                  top: 120,
                  left: 20,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(50.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Big King XXL",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text("50 EGP",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: Colors.black.withOpacity(0.35),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            RestaurantCardDetails(
              rating: rating,
              restaurantName: restaurantName,
              logo: logo,
              tags: tags,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.percent_sharp,
                        size: 20,
                        color: Colors.green[700],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 10),
                        child: Text(
                            "20 EGP on orders above 80 EGP",
                            style: TextStyle(color: Colors.green[700])

                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.lock_clock),
                    Text("$deliveryTime mins")
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(Icons.circle,
                        color: online ? Colors.green : Colors.grey, size: 20),
                    Text(
                      "Order Online",
                      style:
                          TextStyle(color: online ? Colors.green : Colors.grey),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
