import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 10,left: 0),
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
                    // borderRadius: BorderRadius.circular(10),
                    ),
                child: CupertinoTextField(
                  autofocus: true,
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
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel",style: TextStyle(fontSize:18,color: Colors.grey),))
          ],
        ),
      ),
    );
  }
}
