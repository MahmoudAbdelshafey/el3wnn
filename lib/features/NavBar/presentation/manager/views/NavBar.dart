
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../constants/styles.dart';
import '../../../../Account/account.dart';
import '../../../../Login/Login_screen.dart';
import '../../../../Reset Password/Reset_Password.dart';
import '../../../../Tracking/Tracking.dart';
import '../../../../care centers/carecenters.dart';
import '../../../../otpreset/resetPass.dart';
import '../../../../privacy/privacy.dart';
import '../../../../reportmissing/reportmissing.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List pages = [
    reportmissing(),
    carecenters(),
    Tracking(),
    account(),

  ];
  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[CurrentIndex] ,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0,
        vertical: 20),
        child: GNav(
          iconSize: 24,
          duration: Duration(milliseconds: 400),
          color: Colors.black87.withOpacity(0.8),
          activeColor: kSecondryColor,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
         
          gap: 8,
          onTabChange: (index){
            setState(() {
              CurrentIndex = index;
            });
          },
          tabs: [

          GButton(
            icon: Icons.notification_important_outlined, text: "Report a missing",),
          GButton(icon: Icons.image_search, text: "Care centers",),
          GButton(icon: Icons.live_help_outlined, text: "Tracking",),
          GButton(icon: Icons.person, text: "Account",),
        ],
        ),
      ),
    );
  }
}
