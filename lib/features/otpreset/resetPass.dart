import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';
import '../../generated/assets.dart';

import '../Reset Password/Reset_Password.dart';
import '../SplashScreen/Splash.dart';

class resetPass extends StatefulWidget {
  const resetPass({super.key});

  @override
  State<resetPass> createState() => _LoginPageState();
}

class _LoginPageState extends State<resetPass> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {

    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColro,
        image: DecorationImage(
          alignment: AlignmentDirectional.topCenter,
          image: const AssetImage(Assets.imagesLoginback5,),
          fit: BoxFit.fitHeight,
          colorFilter:
          ColorFilter.mode(kMainButColor.withOpacity(0.9), BlendMode.overlay),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 20,right: 20, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width/1.1,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(Assets.imagesLogo),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: _buildForm(),

      ),
    );
  }

  Widget _buildForm() {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Reset Password", style: kTitle,),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter your OTP code which we sent to you", textAlign: TextAlign.center,
                    style: kBodyText1.copyWith(fontSize: 12, color: Colors.grey),),
                ],
              ),

              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false, height: sizeV),
                        _textFieldOTP(first: false, last: false,height: sizeV),
                        _textFieldOTP(first: false, last: false,height: sizeV,),
                        _textFieldOTP(first: false, last: true,height: sizeV,),
                      ],
                    ),
                    SizedBox(
                      height: sizeV*2,
                    ),
                    onboarding_getStartedBtn(buttonName: "Verify",bgColor: kSecondryColor,onPressed: (){
                      Navigator.pushReplacement(context, PageTransition(ResetPassword()));

                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(onPressed: (){}, child: Text("Resend Code", style: kBodyText1.copyWith(fontSize: 14),)),
            ],
          ),
        ),
      ],
    );
  }
  Widget _textFieldOTP({required bool first, last, required height}) {
    return Container(
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },

          showCursor: true,
          readOnly: false,
          cursorColor: kSecondryColor,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kSecondryColor),
                borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),
    );
  }

}
