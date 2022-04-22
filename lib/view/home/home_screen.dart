import 'dart:ui';

import 'package:elmenues/view/home/components/dishes_component.dart';
import 'package:elmenues/view/home/components/offers_card.dart';
import 'package:elmenues/view/home/components/offers_component.dart';
import 'package:elmenues/view/home/components/restaurant_card_details.dart';
import 'package:elmenues/view/home/components/restaurant_component.dart';
import 'package:elmenues/view/home/components/special_restaurant_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:elmenues/theme/app_colors';
import 'components/dishes_option.dart';
import 'components/options_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return SafeArea(
      minimum: EdgeInsets.only(top: 0),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            anchor: 1,
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                floating: false,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Deliver To",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      TextButton.icon(
                          style:
                              TextButton.styleFrom(padding: EdgeInsets.all(0)),
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: appColor.primary,
                            size: 17.5,
                          ),
                          onPressed: () {},
                          label: IntrinsicWidth(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Dokki, dokki",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: appColor.primary),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: appColor.primary,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)
                              // borderRadius: BorderRadius.circular(10),
                              ),
                          child: CupertinoTextField(
                            selectionHeightStyle: BoxHeightStyle.max,
                            prefix: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[400],
                                )),
                            placeholder: "Find a Restaurant or a Dish",
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10)
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.grey[200]!,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                                //to add icon
                                Icons.filter_alt_outlined,
                                color: appColor.primary),
                          ),
                        ),
                      )
                    ],
                  )),
              SliverToBoxAdapter(

                child: Column(children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OptionComponent(
                          fun: () {},
                          icon: Icons.alt_route,
                          title: 'Live Tracking',
                        ),
                        OptionComponent(
                          fun: () {},
                          icon: Icons.local_offer,
                          title: 'offers',
                        ),
                        OptionComponent(
                          fun: () {},
                          icon: Icons.credit_card,
                          title: 'Online Payment',
                        ),
                        OptionComponent(
                          fun: () {},
                          icon: Icons.card_giftcard,
                          title: 'Gifts',
                        ),
                      ],
                    ),
                  ),
                  OffersComponent(offers: [
                    Image.asset("assets/images/offer.png").image,
                    Image.asset("assets/images/offer.png").image,
                    Image.asset("assets/images/offer.png").image
                  ]),
                  SpecialRestaurantMenu(
                      title: "Tasty Offers",
                      seeAllOption: true,
                      onClick: () {},
                      restaurants: [
                        RestaurantComponent(
                          image:
                              Image.asset('assets/images/burger.jpeg').image,
                          restaurantName: "Burger King",
                          deliveryTime: 45,
                          logo:
                              Image.asset('assets/logos/Burger-King-Logo.png')
                                  .image,
                          tags: [
                            'American',
                            'Burger',
                            'Fast Food',
                            'Sandwiches'
                          ],
                          rating: 4.5,
                          offer: "20 EGP on orders above 80 EGP",
                        ),
                        RestaurantComponent(
                          image:
                              Image.asset('assets/images/burger.jpeg').image,
                          restaurantName: "Burger King",
                          deliveryTime: 45,
                          logo:
                              Image.asset('assets/logos/Burger-King-Logo.png')
                                  .image,
                          tags: [
                            'American',
                            'Burger',
                            'Fast Food',
                            'Sandwich'
                          ],
                          rating: 4.5,
                          offer: "20 EGP on orders above 80 EGP",
                        ),
                        RestaurantComponent(
                          image:
                              Image.asset('assets/images/burger.jpeg').image,
                          restaurantName: "Burger King",
                          deliveryTime: 45,
                          logo:
                              Image.asset('assets/logos/Burger-King-Logo.png')
                                  .image,
                          tags: [
                            'American',
                            'Burger',
                            'Fast Food',
                            'Sandwich'
                          ],
                          rating: 4.5,
                          offer: "20 EGP on orders above 80 EGP",
                        ),
                        RestaurantComponent(
                          image:
                              Image.asset('assets/images/burger.jpeg').image,
                          restaurantName: "Burger King",
                          deliveryTime: 45,
                          logo:
                              Image.asset('assets/logos/Burger-King-Logo.png')
                                  .image,
                          tags: [
                            'American',
                            'Burger',
                            'Fast Food',
                            'Sandwich'
                          ],
                          rating: 4.5,
                          offer: "20 EGP on orders above 80 EGP",
                        ),
                      ]),
                  SpecialRestaurantMenu(
                      title: "Trending Now",
                      seeAllOption: false,
                      onClick: () {},
                      restaurants: [
                        RestaurantComponent(
                            image: Image.asset('assets/images/burger.jpeg')
                                .image,
                            restaurantName: "Burger King",
                            deliveryTime: 45,
                            logo: Image.asset(
                                    'assets/logos/Burger-King-Logo.png')
                                .image,
                            tags: [
                              'American',
                              'Burger',
                              'Fast Food',
                              'Sandwiches'
                            ],
                            rating: 4.5),
                        RestaurantComponent(
                            image: Image.asset('assets/images/burger.jpeg')
                                .image,
                            restaurantName: "Burger King",
                            deliveryTime: 45,
                            logo: Image.asset(
                                    'assets/logos/Burger-King-Logo.png')
                                .image,
                            tags: [
                              'American',
                              'Burger',
                              'Fast Food',
                              'Sandwiches'
                            ],
                            rating: 4.5),
                        RestaurantComponent(
                            image: Image.asset('assets/images/burger.jpeg')
                                .image,
                            restaurantName: "Burger King",
                            deliveryTime: 45,
                            logo: Image.asset(
                                    'assets/logos/Burger-King-Logo.png')
                                .image,
                            tags: [
                              'American',
                              'Burger',
                              'Fast Food',
                              'Sandwiches'
                            ],
                            rating: 4.5),
                        RestaurantComponent(
                            image: Image.asset('assets/images/burger.jpeg')
                                .image,
                            restaurantName: "Burger King",
                            deliveryTime: 45,
                            logo: Image.asset(
                                    'assets/logos/Burger-King-Logo.png')
                                .image,
                            tags: [
                              'American',
                              'Burger',
                              'Fast Food',
                              'Sandwiches'
                            ],
                            rating: 4.5),
                      ]),
                  DishesComponent(
                    dishOptions: [
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                      DishOption(
                        name: 'All',
                        image: Image.asset('assets/images/all.jpeg').image,
                      ),
                    ],
                    //                    SingleChildScrollView(

                  ),
                 ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Material(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 10,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset('assets/images/burger.jpeg'),
                                      Text("5555555555")
                                    ],
                                  ),
                                  RestaurantCardDetails(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.percent_sharp,
                                        size: 20,
                                        color: Colors.green[700],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(
                                            "20 EGP on orders above 80 EGP",
                                            style: TextStyle(color: Colors.green[700])

                                        ),
                                      )

                                    ],
                                  ),

                                  Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.lock_clock),
                                      Text("Order Online")

                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
