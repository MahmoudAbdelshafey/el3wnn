
import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../Edit Profile/lang.dart';
import '../Login/Login_screen.dart';
import '../Reset Password/Reset_Password.dart';
import '../SplashScreen/Splash.dart';
import '../lang/EditProfile.dart';
import '../privacy/privacy.dart';

class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return  Scaffold(
      appBar: AppBar(title: Text("Account",style: kBodyText1,),centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.account_box_outlined)
                ),
                Text("Edit Profile",textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width:sizeH*45 ,),
                IconButton(icon:Icon(Icons.arrow_forward_ios_rounded),onPressed:(){
                  Navigator.push(context, PageTransition(EditProfile()));

                },color: kMainButColor,)
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.lock_outline_rounded)
                ),
                Text("Change Password",textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width:sizeH*30 ,),
                IconButton(icon:Icon(Icons.arrow_forward_ios_rounded),onPressed: (){
                  Navigator.push(context, PageTransition(ResetPassword()));
                },color: kMainButColor,)
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.shield_moon_outlined)
                ),
                Text("Privacy Policy",textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width:sizeH*37 ,),
                IconButton(icon:Icon(Icons.arrow_forward_ios_rounded),onPressed:(){
                  Navigator.push(context, PageTransition(privacy()));
                },color: kMainButColor,)
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.g_translate_outlined)
                ),
                Text("Language",textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(width:sizeH*29 ,),
                Text("English",textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color:Colors.black, fontSize: 14,fontWeight: FontWeight.normal),),
                SizedBox(width:sizeH*2 ,),

                IconButton(onPressed: (){
                  Navigator.push(context, PageTransition(lang()));

                },color: kMainButColor, icon: Icon(Icons.arrow_forward_ios_rounded,),)
              ],),
            ),
          ),
          SizedBox(height:sizeV ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: SizeConfig.blockSizeH! * 13,
              width: SizeConfig.blockSizeV! * 100 ,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, PageTransition(Login_Screen()));

                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.4),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout,color: Colors.red),
                    SizedBox(width:sizeH ,),
                    Text("Log Out",
                      style: kBodyText1.copyWith(color: Colors.red),),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
