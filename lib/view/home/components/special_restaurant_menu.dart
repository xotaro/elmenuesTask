import 'package:elmenues/view/home/components/restaurant_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors';

class SpecialRestaurantMenu extends StatelessWidget {
  final String title;
  final Function onClick;
  final bool seeAllOption;
  final List<Widget> restaurants;
  const SpecialRestaurantMenu(
      {Key? key,
      required this.title,
      required this.onClick,
      required this.restaurants,
      required this.seeAllOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15,bottom: 15),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              seeAllOption
                  ? TextButton(
                      onPressed: () => onClick(),
                      child: Text(
                        "See All",
                        style: TextStyle(color: appColor.primary),
                      ))
                  : Container()
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding:  EdgeInsets.only(
              left: 7.5,
              right: 15,
              top: seeAllOption?0:15
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: restaurants),
          ),
        ),
      ]),
    );
  }
}
