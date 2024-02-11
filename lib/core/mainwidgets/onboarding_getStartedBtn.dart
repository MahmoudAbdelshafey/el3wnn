import 'package:flutter/material.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';

class onboarding_getStartedBtn extends StatelessWidget {
  const onboarding_getStartedBtn({
    super.key, required this.buttonName, required this.onPressed, required this.bgColor,
  });
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 13,
        width: SizeConfig.blockSizeV! * 100 ,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: bgColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))
              )
          ),
          child: Text(buttonName,
            style: kBodyText1.copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}
