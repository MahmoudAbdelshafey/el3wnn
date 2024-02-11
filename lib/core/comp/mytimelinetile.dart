import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/styles.dart';
import 'eventcard.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({
    super.key, required this.isFirst, required this.isLast, required this.isPast, required this.isPast2, required this.Content});
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final bool isPast2;
  final String Content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: TimelineTile(
        isLast: isLast,
        isFirst: isFirst,
        beforeLineStyle: LineStyle(color:isPast?kMainButColor.withOpacity(0.3)  : Colors.grey.shade300),
        indicatorStyle: IndicatorStyle(width: 50, color: Colors.grey.shade300,
        iconStyle: IconStyle(iconData:Icons.done,
        color: isPast?  kMainButColor : Colors.grey.shade300),),
        endChild: eventcard(Texts: Content, isPast2: isPast2),
      ),
    );
  }
}
