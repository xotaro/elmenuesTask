import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          
          decoration: BoxDecoration(
            color: appColor.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: appColor.primary
            )
          ),
          child: TextField(
            decoration: new InputDecoration(
                hintText: 'Enter New Name'
            ),
          ),
        ),
      ),
    );
  }
}
