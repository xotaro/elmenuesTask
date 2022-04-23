import 'package:elmenues/core/di/configuartion.dart';
import 'package:elmenues/view/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../login/login_vm.dart';
import '../../theme/app_colors';

class ProfileView extends StatefulWidget {
   ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
   TextEditingController controller=TextEditingController();
@override
  void initState() {
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
      value: getIt<LoginViewModel>(),
      child:
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Consumer<LoginViewModel>(
              builder: (context, model, child) =>
                  model.picture!=""?Row(
                    children: [
                      CircleAvatar(
                        child: Image.network(model.picture,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(model.name,style: TextStyle(color: Colors.black),),
                      )
                    ],
                  ):CircularProgressIndicator(
                    color: appColor.primary,
                  ),
            )
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 50),

            child: Center(
              child: Consumer<LoginViewModel>(
                builder: (context, model, _) =>  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 40,bottom: 50),
                      child: Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: appColor.primary
                            )
                        ),
                        child: TextField(
                          controller: controller,
                          decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Enter New Name'
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: appColor.primary,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: appColor.primary
                            )
                        ),
                        child: TextButton(
                          onPressed: ()  {
                            model.changeName(controller.text);
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginTest(),));
                          },
                          child: Text("Change Name",style: TextStyle(fontSize:15,color: Colors.white),),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: appColor.primary,
                            border: Border.all(
                                color: appColor.primary
                            )
                        ),
                        child: TextButton(
                          onPressed: ()  {
                            model.logoutAction();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginTest(),));
                          },
                          child: Text("Log Out",style: TextStyle(fontSize:15,color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
