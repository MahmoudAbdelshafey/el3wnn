import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el3wnn/constants/styles.dart';
import 'package:el3wnn/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
 
   ProductViewPage({required this.email,required this.Ids,required this.Step, required this.Des, required this.Ima, required this.Lost  }) ;
   String Ima;
  String Des;
  String Lost;
  String email;
  String Step;
  String Ids;


  @override
  _ProductViewPageState createState() => _ProductViewPageState(email, Step, Des, Ima, Lost, Ids);
}

class _ProductViewPageState extends State<ProductViewPage> {
  List<dynamic> productList = [];
  List<String> size = [
    "S",
    "F",
    "C",
    "X",

  ];

  CollectionReference Data = FirebaseFirestore.instance.collection('Data');

  int _selectedColor = 0;
  int _selectedSize = 1;

  _ProductViewPageState(String? email, String? step, String? des, String? ima, String? lost, String ids);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              elevation: 0,
              snap: true,
              floating: true,
              stretch: true,
              backgroundColor: Colors.grey.shade50,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  background: widget.Ima == "" ? Image.asset('assets/images/no.jpg'):Image.network(widget.Ima),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(45),
                  child: Transform.translate(
                    offset: Offset(0, 1),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Center(
                          child: Container(
                            width: 50,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                      ),
                    ),
                  )
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.email,
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(widget.Lost, style: TextStyle(color: kPrimaryColor, fontSize: 14,),),
                                ],
                              ),
                              Text('ss',style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                            widget.Des,
                            style: TextStyle(height: 1.5, color: Colors.grey.shade800, fontSize: 15,),
                          ),
                          Container(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedColor = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Statues', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                          Text('S: Searching', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                          Text('F: Found The Lost', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                          Text('C: Contacting with the user', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                          Text('X: Closed or Finished', style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                          SizedBox(height: 10,),
                          Container(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: size.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = index;
                                      if(index != null){
                                        updateUser( index);
                                      }
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: _selectedSize == index ? kMainButColor : Colors.grey.shade200,
                                        shape: BoxShape.circle
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,),
                          MaterialButton(
                            onPressed: () {

                              Navigator.pop(context);
                            },
                            height: 50,
                            elevation: 0,
                            splashColor: kMainButColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            color: kMainButColor,
                            child: Center(
                              child: Text("Update", style: TextStyle(color: Colors.white, fontSize: 18),),
                            ),
                          )
                        ],
                      )
                  )
                ])
            ),
          ]
      ),
    );
  }
  Future<void> updateUser(int index) {
    String St ="Searching";
    if(index == 1){
St = 'Found the Lost';
    }else if(index == 2){
      St = "Contacting With You";
    }else if (index ==3){
      St = "closed or finished";
    }else{
      St = "Searching";
    }

    return Data.doc(widget.Ids).update({'Step': St}).then((value) =>  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("UserUpdated"))))
        .catchError((error) =>
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update user: $error"))));


  }
}