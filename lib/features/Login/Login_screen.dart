import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/generalTextField.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../../functions/LoginFunc.dart';
import '../../generated/assets.dart';
import '../Admin Screen/admin.dart';
import '../NavBar/presentation/manager/views/NavBar.dart';
import '../Reset Password/Reset_Password.dart';
import '../SignUp/SignUp_screen.dart';
import '../SplashScreen/Splash.dart';
import '../otpreset/emailreset.dart';
import '../otpreset/resetPass.dart';

class Login_Screen extends StatefulWidget {
   Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    bool isloading = false;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();
    void login(String email, String pass) async{
      try{
 http.Response response = await http.post(
     Uri.parse("http://127.0.0.1:8001/api/auth/login?email=ahmed@gmail.com2&password=12345678"),

 );
 print(response.body);
 if(response.statusCode == 200  ){
   if(email.contains("admin") ||email.contains("police")){
     Navigator.pushReplacement(context, PageTransition(const NavBar()));
   }else{
     Navigator.pushReplacement(context, PageTransition(const NavBar()));
   }

 }else{
   print(response.statusCode);
   print('not found');
 }
      }catch(e){
print(e.toString());
      }
    }
    return  ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Kbacktwo,
        body: SingleChildScrollView(
          child: Form(
            key: formKey ,
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
                            Text("Sign In",style: kTitle,),
                          ],
                        ),
                        SizedBox(
                          height: sizeV*7 ,
                        ),

                        Text("Email", style: kBodyText1,),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        generalTextField2(IsPassword: false,label: "Email",hintText: "Email",emailController: emailController),
                        SizedBox(
                          height: sizeV*3 ,
                        ),

                        Text("Password", style: kBodyText1,),
                        SizedBox(
                          height: sizeV*2 ,
                        ),
                        generalTextField2(IsPassword: true,label: "",hintText: "***********",Icons: Icons.remove_red_eye,emailController: passController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context, PageTransition(const EResetPassword()));

                          }, child: Text("Forget Password",style:TextStyle(color: Colors.grey) ,))
                        ],
                      ),
                        onboarding_getStartedBtn(buttonName: "Sign In", onPressed: (){
                          // login(emailController.text.toString(),passController.text.toString());
                          Lgin(emailController.text.toString(), passController.text.toString(), formKey, isloading);

                        }, bgColor: kMainButColor),
                        SizedBox(height:sizeV*3 ,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Or", style: TextStyle(color: kMainButColor, fontSize: 16),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have an Account?", style: TextStyle(color: Colors.grey, fontSize: 16),),
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, PageTransition(Sign_Up()));

                            }, child: Text("Sign Up",style:TextStyle(color: kMainButColor) ,))

                          ],
                        )

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
  Lgin (String emailAddress, String password, GlobalKey<FormState> formkey, bool asy)async{
    if(formkey.currentState!.validate()){


        setState(() {
          asy = true;
        });
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress,
              password: password

          );
          SizeConfig.Email = emailAddress;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully")));
          if(emailAddress.contains('admin')){
            Navigator.pushReplacement(context, PageTransition(adminScreen()));

          }else{
            Navigator.pushReplacement(context, PageTransition(NavBar()));
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email")));


          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password")));


          }else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Data")));

          }
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
