import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantDetails extends StatelessWidget {
  final String restaurantName;
  final List<String> tags;
  final ImageProvider logo;
  final double rating;
  // nullable and optional

  const RestaurantDetails(
      {Key? key,
      required this.restaurantName,
      required this.tags,
      required this.logo,
      required this.rating,
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.92,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 0),
        child: ListTile(

          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          title:  Row(
            children: [
              Expanded(child: Text(restaurantName)),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.star,
                    color: Colors.yellow.shade800,
                  size: 20,),
                  Text('$rating'),

                ],
              ),
            ],
          ),

          subtitle: Text(tags.join(", "), overflow: TextOverflow.ellipsis),

          leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: Image(
                image: logo,
                fit: BoxFit.contain,
              ).image),
          
        ),
      ),
    );
  }

}
class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   RatingBar.builder(
      itemSize: 20,
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (double value) {},
    );
    }

  }


