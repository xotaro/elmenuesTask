import 'package:elmenues/view/home/components/dishes_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors';

class DishesComponent extends StatefulWidget {
  final List<DishOption> dishOptions;
  const DishesComponent({Key? key, required this.dishOptions})
      : super(key: key);

  @override
  _DishesComponentState createState() => _DishesComponentState();
}

class _DishesComponentState extends State<DishesComponent> {
  bool isSelected = false;
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover by dish',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(color: appColor.primary),
                  ))
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.dishOptions.length,
            itemBuilder: (context, index) {
              return DishOption(
                name: 'All',
                image: Image.asset('assets/images/all.jpeg').image,
              )
                  .setIndex(index)
                  .setIsSelected(currentSelectedIndex == index)
                  .setOnSelect(() {
                setState(() {
                  currentSelectedIndex = index;
                });
              });
            },
          ),
        ),
      ],
    );
  }
}
