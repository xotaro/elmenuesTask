import 'package:elmenues/view/home/components/restaurant_card_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RestaurantCard extends StatefulWidget {
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
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  PageController controller = PageController();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ConstrainedBox(

                    child: PageView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset(widget.imagePath,fit: BoxFit.fill,),
                          Image.asset(widget.imagePath,fit: BoxFit.fill,),
                          Image.asset(widget.imagePath,fit: BoxFit.fill,),
                          Image.asset(widget.imagePath,fit: BoxFit.fill,)]

                    ),
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.28),

                  ),
                  Container(
                    color: Colors.black.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                          SmoothPageIndicator(
                            controller: controller,
                            count: 4,
                            effect: ColorTransitionEffect(
                              activeDotColor: Colors.white,
                              dotColor: Colors.white.withOpacity(0.5),
                              dotHeight: 10,
                              dotWidth: 10,
                              radius: 9,
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
            RestaurantCardDetails(
              rating: widget.rating,
              restaurantName: widget.restaurantName,
              logo: widget.logo,
              tags: widget.tags,
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
                    Text("${widget.deliveryTime} mins")
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(Icons.circle,
                        color: widget.online ? Colors.green : Colors.grey, size: 20),
                    Text(
                      "Order Online",
                      style:
                          TextStyle(color: widget.online ? Colors.green : Colors.grey),
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
