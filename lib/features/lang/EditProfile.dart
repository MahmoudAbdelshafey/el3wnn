
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/generalTextField.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return  Scaffold(
      appBar: AppBar(title: Text("EditProfile",style: kBodyText1,),centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full Name",style: kBodyText1,),
            SizedBox(height:sizeV ,),
            generalTextField(IsPassword: false,),
            SizedBox(height:sizeV ,),
            Text("Email",style: kBodyText1,),
            SizedBox(height:sizeV ,),
            generalTextField(IsPassword: false,),
            SizedBox(height:sizeV ,),
            Text("Number",style: kBodyText1,),
            SizedBox(height:sizeV ,),
            TextField(
              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "+966",
                labelStyle: TextStyle(color: kTextboxColor),

                hintStyle: TextStyle(color: Colors.black12),
                enabledBorder:
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: kTextboxColor)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: kTextboxColor)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: kTextboxColor)
                ),
              ),
            ),
            SizedBox(height:sizeV*3 ,),
            onboarding_getStartedBtn(buttonName: 'Save',bgColor: kMainButColor,
                onPressed: (){
              Navigator.pop(context);
                }),

          ],
        ),
      ),
    );
  }
}
