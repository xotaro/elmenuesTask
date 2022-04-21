import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantDetails extends StatelessWidget {
  final String restaurantName;
  final List<String> tags;
  final ImageProvider logo;
  final double rating;
  final String? offer; // nullable and optional

  const RestaurantDetails(
      {Key? key,
      required this.restaurantName,
      required this.tags,
      required this.logo,
      required this.rating,
      this.offer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width*0.92,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 0),
        child: ListTile(
            minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          title: Text(restaurantName),
          subtitle: Text(tags.join(", "), overflow: TextOverflow.ellipsis),
          leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: Image(
                image: logo,
                fit: BoxFit.contain,
              ).image),
          trailing: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                    child: Icon(
                  Icons.star,
                  color: Colors.yellow.shade800,
                )),
                TextSpan(
                  text: '$rating',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
