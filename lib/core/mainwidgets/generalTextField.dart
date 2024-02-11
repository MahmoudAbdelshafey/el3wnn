import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class generalTextField extends StatelessWidget {
   generalTextField(
  {this.hintText, this.Icons, this.label, required this.IsPassword}
      );
String? hintText;
String? label;
IconData? Icons;
bool IsPassword;
  @override
  Widget build(BuildContext context) {
    return TextField(

obscureText: IsPassword== null|| false ? false : IsPassword ,
      decoration: InputDecoration(

        hintText: hintText,labelText: label,
        labelStyle: TextStyle(color: kTextboxColor),
        suffixIcon: Icon(Icons,color: Colors.grey),
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
    );
  }
}
class generalTextField2 extends StatefulWidget {
  generalTextField2(
      {this.hintText, this.Icons, this.label, required this.IsPassword,required this.emailController}
      );
  String? hintText;
  String? label;
  IconData? Icons;
  bool IsPassword;
  TextEditingController emailController;

  @override
  State<generalTextField2> createState() => _generalTextField2State();
}

class _generalTextField2State extends State<generalTextField2> {
  bool test = true;
  void _toggle() {
    setState(() {
      test = !test;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
validator: (data){
  if(data!.isEmpty ){
      return 'field is Required';
  }
},

        controller: widget.emailController ,
        obscureText: widget.IsPassword== null|| false ? false : widget.IsPassword ,
        decoration: InputDecoration(

          hintText: widget.hintText,labelText: widget.label,
          labelStyle: TextStyle(color: kTextboxColor),
          suffixIcon: GestureDetector(
              onTap:  () {
        setState(() {
        widget.IsPassword = !widget.IsPassword;
        });
        },
              child: Icon(widget.Icons,color: Colors.grey)),
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
    );
  }
}