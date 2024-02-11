import 'package:el3wnn/features/NavBar/presentation/manager/views/NavBar.dart';
import 'package:el3wnn/features/otpreset/resetPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/generalTextField.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../../generated/assets.dart';
import '../Login/Login_screen.dart';
import '../SplashScreen/Splash.dart';

class EResetPassword extends StatefulWidget {
  const EResetPassword({super.key});

  @override
  State<EResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<EResetPassword> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    TextEditingController emailController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;

    return  Scaffold(
      backgroundColor: Kbacktwo,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Assets.imagesLogo,width:sizeH *70 ),
                // SizedBox(height: sizeV*,),
                Container(

                  width: sizeH*100,
                  height: sizeV*85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.vertical(top:  Radius.circular(40)) ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: sizeV*3 ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Pass Reset",style: kTitle,),
                          ],
                        ),
                        SizedBox(
                          height: sizeV ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("write your email to  get \ncode reset",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.grey, ),),
                          ],
                        ),

                        SizedBox(
                          height: sizeV*5 ,
                        ),
                        Text("email", style: kBodyText1,),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        generalTextField2(IsPassword: false,label: "Email",hintText: "Email",emailController: emailController),

                        onboarding_getStartedBtn(buttonName: "Reset Password", onPressed: (){
                          Res(emailController.text.toString(), formKey, isLoading);

                        }, bgColor: kMainButColor),
                        SizedBox(height:sizeV*3 ,),


                      ],
                    ),
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Res (String emailAddress, GlobalKey<FormState> formkey, bool asy)async{
    if(formkey.currentState!.validate()){


      setState(() {
        asy = true;
      });
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailAddress);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Code Sent")));
        Navigator.pushReplacement(context, PageTransition(resetPass()));

      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code.toString())));

      }

      setState(() {
        asy = false;
      });


    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('something missing')));

    }
  }
}
