
import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../generated/assets.dart';
import '../SplashScreen/Splash.dart';
import '../reportmissingsend/reportmissingsend.dart';

class reportmissing extends StatelessWidget {

  const reportmissing({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return  Scaffold(
      appBar: AppBar(title: Text("Report A Missing",style: kBodyText1,),centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width:sizeH*100 ,
              height:sizeV *30 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      kMainButColor,
                      kSecondryColor,
                      kSecondryColor
                    ],
                  )              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Al3wn application\n "
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                textAlign: TextAlign.center,
                style: kBodyText1.copyWith(color: Colors.white,
                fontSize: 14),),
              ),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: (){
                Navigator.push(context, PageTransition(reportmissingsend()));
              },
                child: Container(
                  width: sizeH*40 ,
                  height: sizeV*20,
                  decoration: BoxDecoration(
                    color: kSecondryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height:sizeV*0.2 ,
                      ),
                    Container(
                    width: sizeH*20 ,
                    height: sizeV*6,
                    decoration: BoxDecoration(
                      color: kSecondryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(Assets.imagesDiamong,),
                    ),),
                      Text("Report Missing something", textAlign: TextAlign.center,
                        style: kBodyText1.copyWith(color:kSecondryColor, fontSize: 14),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(reportmissingsend()));
                },
                child: Container(
                  width: sizeH*40 ,
                  height: sizeV*20,
                  decoration: BoxDecoration(
                    color: kMainButColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height:sizeV*0.2 ,
                      ),
                    Container(
                    width: sizeH*20 ,
                    height: sizeV*6,
                    decoration: BoxDecoration(
                      color: kMainButColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(Assets.imagesChild,),
                    ),),
                      Text("Report Missing\n child", textAlign: TextAlign.center,
                        style: kBodyText1.copyWith(color:kMainButColor, fontSize: 14),)
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
