import 'package:flutter/cupertino.dart';

import '../../constants/size_config.dart';
import '../../constants/styles.dart';

class eventcard extends StatelessWidget {
  const eventcard({super.key, required this.Texts, required this.isPast2});
final String Texts;
final bool isPast2;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Container(
      margin: EdgeInsets.all(25),

      child: Text(Texts,
          style: isPast2? kBodyText1.copyWith(color: kMainButColor) : kBodyText1),
    );
  }
}
