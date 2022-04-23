import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors';

class FilterScreen extends StatefulWidget {
  final int restaurants;
  const FilterScreen({Key? key, required this.restaurants}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with TickerProviderStateMixin{
  late TabController _tabController;
  int _radioSelected = -1;
@override
  void initState() {
    // TODO: implement initState
  _tabController = TabController(length: 3,vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Close",style: TextStyle(color: appColor.primary,fontSize: 15,fontWeight: FontWeight.w400),)),
              ElevatedButton(onPressed: (){}, child: Text("Show ${widget.restaurants} results"),style: ElevatedButton.styleFrom(
                primary: appColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              )
            ],
          ),
        ),
        
        bottom:  TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          labelColor: appColor.primary,
          indicatorColor: appColor.primary,
          tabs: [
             Tab(child:  Text('Sorting',style: TextStyle(fontSize: 15),)),
             Tab(child:  Text('Filters',style: TextStyle(fontSize: 15))),
             Tab(child:  Text('Dishes',style: TextStyle(fontSize: 15))),
            // Add Tabs here
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 15,bottom: 15),
                child: Text('Sort by',style: TextStyle(fontSize: 18),),
              ),
              Row(

                children: [
                  Radio(

                    autofocus: false,
                    value: 1,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int ;
                      });
                    },
                    activeColor: appColor.primary,
                  ),
                  Text('Delivery Time',style: TextStyle(fontSize: 18,color: Colors.grey[700]),)
                ],
              ),
              Row(
                children: [
                  Radio(

                    value: 2,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int ;
                      });
                    },
                    activeColor: appColor.primary,
                  ),
                  Text('Rating',style: TextStyle(fontSize: 18,color: Colors.grey[700]))
                ],
              ),
              Row(
                children: [
                  Radio(

                    value: 3,
                    groupValue: _radioSelected,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int ;
                      });
                    },
                    activeColor: appColor.primary,
                  ),
                  Text('Popular',style: TextStyle(fontSize: 18,color: Colors.grey[700]))
                ],
              ),

            ],
          ),
          Center(
            child: Text('Filters')
          ),
          Center(
              child: Text('Dishes')
          ),
        ],
      ),
    );
  }
}
