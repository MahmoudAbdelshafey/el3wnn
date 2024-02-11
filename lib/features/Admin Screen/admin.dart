import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el3wnn/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../Login/Login_screen.dart';
import '../SplashScreen/Splash.dart';
import 'details.dart';

class adminScreen extends StatelessWidget {
  const adminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    List<String> ima = [];
    List<String> Des = [];
    List<String> Lost = [];
    List<String> Step = [];
    List<String> email = [];
    List Ids = [];

    CollectionReference Datas = FirebaseFirestore.instance.collection('Data');

    return  FutureBuilder<QuerySnapshot>(
      future: Datas.get(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          for(int i = 0; i< snapshot.data!.docs.length; i++){
            ima.add(snapshot.data!.docs[i]['Image']);
            Des.add(snapshot.data!.docs[i]['Description']);
            Lost.add(snapshot.data!.docs[i]['LostIn']);
            Step.add(snapshot.data!.docs[i]['Step']);
            email.add(snapshot.data!.docs[i]['email']);
            Ids.add(snapshot.data!.docs[i].id);
          }
          return Scaffold(
            appBar: AppBar(title: Text("Missings",style: kBodyText1,),centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 600,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount:((Step.length)/2 ).ceil(),
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(ProductViewPage(Des: Des[index],email: email[index],Ima: ima[index],
                            Lost: Lost[index],Step: Step[index],Ids : Ids[index])));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 60,

                            decoration: BoxDecoration(

                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ima[index] == "" ? Image.asset('assets/images/no.jpg'):Image.network(ima[index]),
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Lost Item',style: kTitle, ),
                                    Text(Des[index],style: kBodyText1.copyWith(fontSize: 14),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition( Login_Screen()));

                    },
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Kbacktwo,
                        borderRadius: BorderRadius.circular(30),


                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(Icons.logout, color: Colors.red, size: 40,),
                          ),
                          Text('LogOut', style: kTitle.copyWith(color: Colors.red),)
                        ],
                      ),
                      ),
                  )
                ],
              ),
            ),
          );
        }else{
         return Center(
           child : Text("Loading", style: kTitle,)
         );
        }
      },

    );
  }
}
