
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';

class lang extends StatefulWidget {
  const lang({super.key});

  @override
  State<lang> createState() => _langState();
}

class _langState extends State<lang> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    bool eng = true;
    bool arab = false;
    return  Scaffold(
      appBar: AppBar(title: Text("Language",style: kBodyText1,),centerTitle: true),
      body: Column(
        children: [
        Row(
          children: [
            Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith((states) {

            }),
            value: eng,
            shape: CircleBorder(),
            onChanged: (bool? value) {

            setState(() {
              eng = true;
              arab = false;
            });
            },
      ),
            Text("English",style: kBodyText1,),

          ],
        ),
        Row(
          children: [
            Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith((states) {

            }),
            value: arab,
            shape: CircleBorder(),
            onChanged: (bool? value) {

setState(() {
  arab = true;
  eng = false;
});
            },
      ),
            Text("العربية",style: kBodyText1,),

          ],
        ),

        ],
      ),
    );
  }
}
