import 'package:flutter/material.dart';
import 'package:trader_app/Ui/color_code.dart';

class Test extends StatelessWidget {
  // final Color? backgroundColor;
  // final Text label;
  // final TextStyle? textStyle;
  // final Icon icon;
  // final IconData? iconData;
  // final BorderRadius? borderRadius;
  const Test({
    super.key,
    // this.backgroundColor,
    // required this.label,
    // this.textStyle,
    // required this.icon,
    // this.iconData,
    // this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: ColorCode.white,
        ),
        child: ListView.builder(
          itemCount: 7,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.ac_unit,),
              Text('Labels',)
            ],
          );
        },)
      ),
    );
  }
}
