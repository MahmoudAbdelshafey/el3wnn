import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';

class privacy  extends StatelessWidget {
  const privacy ({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return  Scaffold(
      backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: sizeV ,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Privacy Policy", style: kTitle,),
                ],
              ),
              SizedBox(height:sizeV*5,),

              Text(
                  "Our Privacy Policy explains what personal information"
                      " we collect, how we use personal information,"
                      "how personal information is shared, and privacy rights.",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
              SizedBox(height:sizeV*2,),
              Text(
                  "1. DEFINITIONS\n"
                      "2. PERSONAL INFORMATION WE COLLECT\n"
                      "2.1 Information Needed to Use the Airbnb Platform.\n",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
              Text(
                  "We collect personal information about you when you use the Airbnb Platform. Without it, we may not be able to provide all services requested. This information includes:",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black38),),
              SizedBox(height:sizeV*1,),
              Text(
                "1. DEFINITIONS\n"
                    "2. PERSONAL INFORMATION WE COLLECT\n"
                    "2.1 Information Needed to Use the Airbnb Platform.\n",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
              Text(
                "Our Privacy Policy explains what personal information"
                    " we collect, how we use personal information,"
                    "how personal information is shared, and privacy rights.",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
              SizedBox(height:sizeV*2,),
              Text(
                "1. DEFINITIONS\n"
                    "2. PERSONAL INFORMATION WE COLLECT\n"
                    "2.1 Information Needed to Use the Airbnb Platform.\n",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
              Text(
                "We collect personal information about you when you use the Airbnb Platform. Without it, we may not be able to provide all services requested. This information includes:",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black38),),
              SizedBox(height:sizeV*1,),
              Text(
                "1. DEFINITIONS\n"
                    "2. PERSONAL INFORMATION WE COLLECT\n"
                    "2.1 Information Needed to Use the Airbnb Platform.\n",
                style: kBodyText1.copyWith(fontSize: SizeConfig.blockSizeH! *4, color: Colors.black54),),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
