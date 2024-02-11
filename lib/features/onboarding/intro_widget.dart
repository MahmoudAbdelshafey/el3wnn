import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';

import '../Login/Login_screen.dart';
import '../SplashScreen/Splash.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.onTab,
    required this.index,});

  final String color;
  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return ColoredBox(
      color: hexToColor(color),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: skip
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTab,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: hexToColor(color),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 30),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(context, PageTransition(LoginPage()));

                          },
                          child: const Text('Skip Now', style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),

                  ],
                )
                    :  SizedBox(
                  height: 46,
                  child: MaterialButton(
                    color: hexToColor(color),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () {},
                    child: const Text('Get Started', style: TextStyle(color: Colors.white)),
                  ),
                )
            ),
          ),

          Container(
            width: sizeH*100,
            height: sizeV*70 ,
            decoration: BoxDecoration(
              color: kBackgroundColro,
              image: DecorationImage(
                alignment: AlignmentDirectional.topCenter,
                image:  AssetImage(image),
                fit: BoxFit.cover,
                // colorFilter:
                // ColorFilter.mode(kMainButColor.withOpacity(0.9), BlendMode.overlay),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,

            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height / 1.86,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(image),
          //       fit: BoxFit.fill
          //     )
          //   ),
          // ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Skip Now', style: TextStyle(color: Colors.grey),),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22,),
                    Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffb3935c))),
                    const SizedBox(height: 16,),
                    Text(description, style: const TextStyle(fontSize: 18, height: 1.5, color: Colors.grey), textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: skip
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTab,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: hexToColor(color),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 30),
                    ),
                  ),



                ],
              )
              :  SizedBox(
                height: 46,
                child: MaterialButton(
                  color: hexToColor(color),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                     Navigator.pushReplacement(context, PageTransition(Login_Screen()));
                  },
                  child: const Text('Get Started', style: TextStyle(color: Colors.white)),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
