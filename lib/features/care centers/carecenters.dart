
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../../generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://www.google.com/maps/place/Makkah+Saudi+Arabia/@21.4360154,39.8465466,11z/data=!3m1!4b1!4m6!3m5!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!8m2!3d21.4240968!4d39.8173364!16zL20vMDU4d3A?entry=ttu');
final Uri _url2 = Uri.parse('https://www.google.com/maps/place/Makkah+Saudi+Arabia/@21.4360154,39.8465466,11z/data=!3m1!4b1!4m6!3m5!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!8m2!3d21.4240968!4d39.8173364!16zL20vMDU4d3A?entry=ttu');

class carecenters extends StatelessWidget {
  const carecenters({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return  Scaffold(
      appBar: AppBar(title: Text("Care Centers",style: kBodyText1,),centerTitle: true),
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width:sizeH*100 ,
              height:sizeV *18 ,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(Assets.imagesMaps,width:sizeH*100 ,fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kSecondryColor.withOpacity(0.7)              ),
                  ),

                  Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text("Attention: Ministry of Hajj \nand Umrah, Mecca Branch",
                        textAlign: TextAlign.center,
                        style: kBodyText1.copyWith(color: Colors.white,
                            fontSize: 14),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Container(
                          height:sizeV*5 ,
                          child: onboarding_getStartedBtn(onPressed: _launchUrl,bgColor: kMainButColor,buttonName: "Location Link")),
                    ),

                  ]),

                ],
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              width:sizeH*100 ,
              height:sizeV *18 ,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(Assets.imagesMaps,width:sizeH*100 ,fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kSecondryColor.withOpacity(0.7)              ),
                  ),

                  Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text("Attention: Ministry of Hajj \nand Umrah, Mecca Branch",
                        textAlign: TextAlign.center,
                        style: kBodyText1.copyWith(color: Colors.white,
                            fontSize: 14),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Container(
                          height:sizeV*5 ,
                          child: onboarding_getStartedBtn(onPressed: _launchUrl2,bgColor: kMainButColor,buttonName: "Location Link")),
                    ),

                  ]),

                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }}
Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url');
  }}
