import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/generalTextField.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../../generated/assets.dart';
import '../Admin Screen/admin.dart';
import '../Login/Login_screen.dart';
import '../NavBar/presentation/manager/views/NavBar.dart';
import '../SplashScreen/Splash.dart';
import '../privacy/privacy.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  bool ischecked = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    String dropdownvalue = 'Person';
    GlobalKey<FormState> formKey = GlobalKey();
    var items = [
      'Person',
      'Admin',
      'Police',
    ];
    void signUp(String name, String email, String pass, String type) async{
      try{
        Response response = await post(Uri.parse("http://127.0.0.1:8000/api/auth/register"),
            body:
            {
              'name' : name,
              'email' : email,
              'password' : pass,
              'you_are' : type
            }
        );
        if(response.statusCode == 200){
          Navigator.pushReplacement(context, PageTransition(const NavBar()));
        }else{
          print('not found');
        }
      }catch(e){
        print(e.toString());
      }
    }

    bool rememberUser = false;
    bool asynccall = false;

    return  ModalProgressHUD(
      inAsyncCall: asynccall,
      child: Scaffold(
        backgroundColor: Kbacktwo,
        body: SafeArea(
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Assets.imagesLogo,width:sizeH *70 ),
                // SizedBox(height: sizeV*,),
                Container(

                  width: sizeH*100,
                  height: sizeV*95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.vertical(top:  Radius.circular(40)) ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: formKey ,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: sizeV*3 ,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sign Up",style: kTitle,),
                            ],
                          ),
                          SizedBox(
                            height: sizeV*2 ,
                          ),

                          Text("Full Name", style: kBodyText1,),
                          SizedBox(
                            height: sizeV*2 ,
                          ),
                          generalTextField2(IsPassword: false,label: "Full Name",hintText: "Ahmed Mahmoud",emailController: nameController),
                          SizedBox(
                            height: sizeV*1 ,
                          ),
                          Text("Email", style: kBodyText1,),
                          SizedBox(
                            height: sizeV*2 ,
                          ),
                          generalTextField2(IsPassword: false,label: "Email",hintText: "@gmail.com",emailController: emailController),
                          SizedBox(
                            height: sizeV*1 ,
                          ),

                          Text("Password", style: kBodyText1,),
                          SizedBox(
                            height: sizeV*2 ,
                          ),
                          generalTextField2(IsPassword: true,label: "",hintText: "***********",Icons: Icons.remove_red_eye,emailController: passController),

                          Row(
                            children: [
                              Checkbox(
                                  value: ischecked,
                                  onChanged: (value) {
                                    if(ischecked){
                                      ischecked = false;
                                    }else{
                                      ischecked = true;
                                    }
                                    rememberUser = value!;
                                    setState(() {

                                    });
                                  },
                              activeColor: kMainButColor,
                              checkColor: Colors.white,
                              ),

                              Text("I agree to the", style: TextStyle(color: Colors.grey),),
                              TextButton(onPressed: (){
                                Navigator.push(context, PageTransition(privacy()));

                              }, child: Text("terms and conditions"))
                            ],
                          ),
                          SizedBox(height:sizeV*2 ,),

                          onboarding_getStartedBtn(buttonName: "Sign up", onPressed: (){
                            // signUp(nameController.text.toString(),emailController.text.toString(),passController.text.toString(),"Person");
                            Register(emailController.text.toString(), passController.text.toString(), ischecked, formKey,asynccall);



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
                              Text("already have Account?", style: TextStyle(color: Colors.grey, fontSize: 16),),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(context, PageTransition(Login_Screen()));

                              }, child: Text("Sign in",style:TextStyle(color: kMainButColor) ,))

                            ],
                          ),

                        ],
                      ),
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
Register(String emailAddress, String password, bool check, GlobalKey<FormState> formkey, bool asy)async{
if(formkey.currentState!.validate()){
  if(check){
    asy = true;
    setState(() {

    });
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      SizeConfig.Email = emailAddress;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));

      if(emailAddress.contains('admin')){
        Navigator.pushReplacement(context, PageTransition(adminScreen()));

      }else{
        Navigator.pushReplacement(context, PageTransition(NavBar()));

      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The Password Is Weak")));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The account already exists")));


      }
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.toString())));

    }
    asy = false;
    setState(() {

    });
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('something missing')));

  }

}
else{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('something missing')));

}
}
}
