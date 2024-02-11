import 'package:el3wnn/features/NavBar/presentation/manager/views/NavBar.dart';
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

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    TextEditingController PassController = TextEditingController();
    TextEditingController secPassController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Kbacktwo,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                            Text("New Password",style: kTitle,),
                          ],
                        ),
                        SizedBox(
                          height: sizeV ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("write your new password in the \ntwo field to continue",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.grey, ),),
                          ],
                        ),

                        SizedBox(
                          height: sizeV*5 ,
                        ),
                        Text("Password", style: kBodyText1,),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        generalTextField2(IsPassword: true,label: "",hintText: "***********",Icons: Icons.remove_red_eye,emailController: PassController),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        Text("Rerwite Password", style: kBodyText1,),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        generalTextField2(IsPassword: true,label: "",hintText: "***********",Icons: Icons.remove_red_eye,emailController: secPassController),
                        SizedBox(
                          height: sizeV*3 ,
                        ),
                        onboarding_getStartedBtn(buttonName: "Change Password", onPressed: (){
                          Navigator.pushReplacement(context, PageTransition(NavBar()));

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

  rss (String emailAddress, String password, GlobalKey<FormState> formkey, bool asy)async{
    if(formkey.currentState!.validate()){


      setState(() {
        asy = true;
      });
      try {
        await FirebaseAuth.instance.currentUser!.updatePassword(password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Updated")));
        Navigator.pushReplacement(context, PageTransition(NavBar()));

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
