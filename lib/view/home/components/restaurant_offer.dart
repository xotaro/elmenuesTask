import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors';

class ImageDelivery extends StatelessWidget {
  final ImageProvider image;
  final int deliveryTime;
  const ImageDelivery({Key? key, required this.image, required this.deliveryTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.5,right: 0),
      child: Stack(
        children: [
          ClipRRect(

            child: Image(
              height:MediaQuery.of(context).size.height*0.18,
              fit: BoxFit.fitWidth,
              width:MediaQuery.of(context).size.width*0.92, image: image ,

            ),
            borderRadius: BorderRadius.circular(5),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.18,
              height:MediaQuery.of(context).size.height*0.04 ,
              child: Center(child: Text("$deliveryTime mins",style: TextStyle(color: appColor.primary),)),
            ),
          ),
        ],
      ),
    );

  }
}
