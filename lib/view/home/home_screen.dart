import 'dart:math';
import 'dart:ui';

import 'package:elmenues/core/domain/restaurant.dart';
import 'package:elmenues/view/home/components/dishes_component.dart';
import 'package:elmenues/view/home/components/offers_component.dart';
import 'package:elmenues/view/home/components/restaurant_card.dart';
import 'package:elmenues/view/home/components/restaurant_card_details.dart';
import 'package:elmenues/view/home/components/restaurant_component.dart';
import 'package:elmenues/view/home/components/special_restaurant_menu.dart';
import 'package:elmenues/view/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elmenues/theme/app_colors';
import 'package:provider/provider.dart';
import '../../core/di/configuartion.dart';
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
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => getIt(),
          child: Padding(
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
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0)),
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
                  child: Consumer<HomeViewModel>(
                    builder: (context, model, _) =>
                       model.restaurants.isNotEmpty? Column(children: [
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
                          restaurants: model.restaurantsOffers.map((e) {
                             return RestaurantComponent(
                              image: Image.asset(e.imagesPath).image,
                              deliveryTime: e.deliveryTime,
                              logo: Image.asset(e.logoPath).image,
                              restaurantName: e.name,
                              offer: e.offer,
                              rating: e.rating,
                              tags: e.tags,
                            );

                          }).toList()),
                      SpecialRestaurantMenu(
                          title: "Trending Now",
                          seeAllOption: false,
                          onClick: () {},
                          restaurants: model.restaurants.map((e) {
                            if(!e.offerOn)
                            {   return RestaurantComponent(
                              image: Image.asset(e.imagesPath).image,
                              deliveryTime: e.deliveryTime,
                              logo: Image.asset(e.logoPath).image,
                              restaurantName: e.name,
                              offer: e.offer,
                              rating: e.rating,
                              tags: e.tags,
                            );}
                            else{
                              return Container();
                            }
                          }).toList()),
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
                          Restaurant restaurant = model.restaurants[index];
                          return RestaurantCard(
                              imagePath: restaurant.imagesPath,
                              online: restaurant.online,
                              deliveryTime: restaurant.deliveryTime,
                              restaurantName: restaurant.name,
                              logo: restaurant.logoPath,
                              tags: restaurant.tags,
                              rating: restaurant.rating);
                        },
                        itemCount: model.restaurants.length,
                      ),
                    ]):
                           Center(child: CircularProgressIndicator(
                             color: appColor.primary,
                           ))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
