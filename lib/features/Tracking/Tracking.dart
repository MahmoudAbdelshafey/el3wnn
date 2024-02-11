
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/comp/mytimelinetile.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    bool have = false;
    List Ids = [];
    List<String> Step = [];
    bool firstitem = false;
    bool secondItem = false;
    bool ThirdItem = false;
    bool FourthItem = false;
    CollectionReference Datas = FirebaseFirestore.instance.collection('Data');
    return FutureBuilder<QuerySnapshot>(
      future: Datas.get(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          for(int i = 0; i< snapshot.data!.docs.length; i++){
            Step.add(snapshot.data!.docs[i]['Step']);
            Ids.add(snapshot.data!.docs[i].id);
          }
          if(Step[0] == 'Searching'){
            firstitem= true;
          }else if(Step[0] == 'Found the Lost'){
            firstitem= true;
            secondItem= true;
          }else if(Step[0] == 'Contacting With You'){
            firstitem= true;
            secondItem= true;
            ThirdItem= true;
          }else if(Step[0] == 'closed or finished'){
            firstitem= true;
            secondItem= true;
            ThirdItem= true;
            FourthItem= true;
          }
          return Scaffold(
          appBar: AppBar(title: Text("Tracking",style: kBodyText1,),centerTitle: true),
    body: have? Center(
    child: Text("You Have Not Any Missing",style: kBodyText1),
    ) : Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: ListView(
    children: [
    MyTimeLine(
    isFirst: true,
    isLast: false,
    isPast: firstitem,
    isPast2: firstitem,
    Content: 'Reporting Sent Successfully',),
    MyTimeLine(
    isFirst: false,
    isLast: false,
    isPast: firstitem,
    isPast2: firstitem,
    Content: 'Our men is searching now ',),
    MyTimeLine(
    isFirst: false,
    isLast: false,
    isPast: secondItem,
    isPast2: secondItem,
    Content: 'we found your lost ',),
    MyTimeLine(
    isFirst: false,
    isLast: false,
    isPast: ThirdItem,
    isPast2: ThirdItem,
    Content: 'Location Sent to meet',),
    MyTimeLine(
    isFirst: false,
    isLast: true,
    isPast: FourthItem,
    isPast2: FourthItem,
    Content: 'reporting Closed',),

    ],
    ),
    )
    );
        }else{
          return Center(
            child: Text("You Don't Have Any Losts Yet", style: kTitle,),
          );
        }
      });

  }
}
