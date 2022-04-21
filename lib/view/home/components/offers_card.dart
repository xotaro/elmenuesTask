import 'package:flutter/cupertino.dart';

class OffersCard extends StatelessWidget {
  final ImageProvider image;
  const OffersCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(image: image,fit: BoxFit.fitWidth),
    )
    );
  }
}
