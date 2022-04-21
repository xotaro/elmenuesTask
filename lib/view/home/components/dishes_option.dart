import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors';

class DishOption extends StatefulWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;
  const DishOption(
      {Key? key,
      required this.isSelected,
      required this.onSelect,
      required this.index})
      : super(key: key);

  @override
  _DishOptionState createState() => _DishOptionState();
}

class _DishOptionState extends State<DishOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: widget.onSelect,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isSelected
                        ? appColor.primary
                        : Colors.transparent,
                    width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.22,
                      maxHeight: MediaQuery.of(context).size.height * 0.09),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/all.jpeg'))),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('All'),
            )
          ],
        ),
      ),
    );
  }
}
