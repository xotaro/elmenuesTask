import 'dart:ui';
import 'dart:math' as math;

import 'package:elmenues/core/domain/restaurant.dart';
import 'package:elmenues/view/home/components/dishes_component.dart';
import 'package:elmenues/view/home/components/offers_component.dart';
import 'package:elmenues/view/home/components/restaurant_card.dart';
import 'package:elmenues/view/home/components/restaurant_component.dart';
import 'package:elmenues/view/home/components/special_restaurant_menu.dart';
import 'package:elmenues/view/home/filter_screen.dart';
import 'package:elmenues/view/home/home_view_model.dart';
import 'package:elmenues/view/home/search_screen.dart';
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
  TextEditingController searchController=TextEditingController();
  bool switcher=true;
 @override
  void initState() {
   // searchController

   super.initState();
  }

@override
  Widget build(BuildContext context) {

    return SafeArea(
      minimum: EdgeInsets.only(top: 0),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: ChangeNotifierProvider<HomeViewModel>.value(
          value: getIt<HomeViewModel>(),
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
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: const Text(
                            "Deliver To",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: () {
                                displayBottomSheet(context);
                              },
                              child: IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: appColor.primary,
                                    ),
                                    Text(
                                      "Dokki, dokki",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: appColor.primary,
                                          fontSize: 17),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: appColor.primary,
                                    )
                                  ],
                                ),
                              )),
                        ),
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
                            height: MediaQuery.of(context).size.height*0.05,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)
                                // borderRadius: BorderRadius.circular(10),
                                ),
                            child: CupertinoTextField(
                              controller: searchController,
                              autofocus: false,
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                                );
                              },

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
                            height: MediaQuery.of(context).size.height*0.05,

                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.grey[200]!,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Consumer<HomeViewModel>(
                              builder: (context, value, child) => IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  FilterScreen(restaurants: value.restaurants.length,)),
                                  );
                                },
                                icon: Icon(
                                  //to add icon
                                    Icons.filter_alt_outlined,
                                    color: appColor.primary),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SliverToBoxAdapter(
                  child: Consumer<HomeViewModel>(
                      builder: (context, model, _) => model
                              .restaurants.isNotEmpty
                          ? Column(children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                    if (!e.offerOn) {
                                      return RestaurantComponent(
                                        image: Image.asset(e.imagesPath).image,
                                        deliveryTime: e.deliveryTime,
                                        logo: Image.asset(e.logoPath).image,
                                        restaurantName: e.name,
                                        offer: e.offer,
                                        rating: e.rating,
                                        tags: e.tags,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }).toList()),
                              DishesComponent(
                                dishOptions: [
                                  DishOption(
                                    name: 'All',
                                    image: Image.asset('assets/images/all.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'pizza',
                                    image: Image.asset('assets/images/pizza.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'fried chicken',
                                    image: Image.asset('assets/images/fried_chicken.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'pizza',
                                    image: Image.asset('assets/images/pizza.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'fried chicken',
                                    image: Image.asset('assets/images/fried_chicken.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'fried chicken',
                                    image: Image.asset('assets/images/fried_chicken.jpeg')
                                        .image,
                                  ),
                                  DishOption(
                                    name: 'fried chicken',
                                    image: Image.asset('assets/images/fried_chicken.jpeg')
                                        .image,
                                  ),

                                ],
                                //                    SingleChildScrollView(
                              ),
                              ListTile(
                                title:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Restaurans (${model.restaurants.length})",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      RichText(
                                        text: TextSpan(
                                          children: [

                                            WidgetSpan(
                                              child: Icon(Icons.check_circle, size: 14,color: Colors.green,),
                                            ),
                                            TextSpan(
                                              text: "ORDER ONLINE",
                                              style: TextStyle(color: Colors.green)
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                trailing: CupertinoSwitch(value: model.switcher, onChanged: (x){
                                 model.setSwitcher(x);
                                })

                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Restaurant restaurant =
                                      model.restaurants[index];
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
                            ])
                          : Center(
                              child: CircularProgressIndicator(
                              color: appColor.primary,
                                strokeWidth: 6,
                                backgroundColor: Colors.white,
                            ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.42,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text("Choose your delivery location",
                        style: TextStyle(fontSize: 15),),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.06,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)
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
                          placeholder: "Search for your address",
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),

                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          leading: Transform.rotate(
                              angle: 45 * math.pi / 180,
                              child: Icon(
                                Icons.navigation_outlined,
                                color: appColor.primary,
                                size: 20,
                              )),
                          title: Text("Deliver to my current location")),
                    ],
                  ),
                ),

                Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                  indent: 0,
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 20.0,top: 10),

                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Text("Yor recent delivery locations",
                     style: TextStyle(
                       color: Colors.grey,
                       fontSize: 12
                     ),),
                     ListTile(
                       contentPadding: EdgeInsets.zero,
                       horizontalTitleGap: 0,

                       leading: Icon(Icons.av_timer_sharp),
                       title: Text("Dokki, Dokki"),
                     ),
                   ],
                 ),
               ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
             Padding(
               padding: const EdgeInsets.only(left: 20.0),

               child: Column(
               children: [
                 ListTile(
                   horizontalTitleGap: 0,
                   contentPadding: EdgeInsets.zero,
                   leading: Icon(
                     Icons.add,
                     color: appColor.primary,
                   ),
                   title: Text(
                     "Choose another location",
                     style: TextStyle(color: appColor.primary),
                   ),
                 ),
               ],
             ),)
              ],
            ),
          ),
        );
      });

}
