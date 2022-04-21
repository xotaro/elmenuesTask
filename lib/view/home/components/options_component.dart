import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionComponent extends StatelessWidget {
  final String title;
  final Function fun;
  final IconData icon;
  const OptionComponent({Key? key, required this.title, required this.fun, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                           Padding(
      padding: const EdgeInsets.all(15),
      child: OutlinedButton(
        onPressed: fun(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: Colors.deepOrange,),
            FittedBox(child: Text(title,style: TextStyle(color: Colors.black),)),
          ],

        ),
        style: OutlinedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.07),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );

  }
}
