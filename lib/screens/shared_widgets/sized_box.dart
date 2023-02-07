import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/env/dimensions.dart';

class AppSizedBox {
  // SizedBox height
  static SizedBox sizedBoxH3 = SizedBox(
    height: Dimensions.calcW(3.0),
  ); static SizedBox sizedBoxH5 = SizedBox(
    height: Dimensions.calcW(5.0),
  );
  static SizedBox sizedBoxH8 = SizedBox(
    height: Dimensions.calcW(8.0),
  );
  static SizedBox sizedBoxH10 = SizedBox(
    height: Dimensions.calcW(10.0),
  );
  static SizedBox sizedBoxH13 = SizedBox(
    height: Dimensions.calcW(13.0),
  );
  static SizedBox sizedBoxH15 = SizedBox(
    height: Dimensions.calcW(15.0),
  );
  static SizedBox sizedBoxH17 = SizedBox(
    height: Dimensions.calcW(17.0),
  );
  static SizedBox sizedBoxH18 = SizedBox(
    height: Dimensions.calcW(18.0),
  );
  static SizedBox sizedBoxH20 = SizedBox(
    height: Dimensions.calcW(20.0),
  );
  static SizedBox sizedBoxH22 = SizedBox(
    height: Dimensions.calcW(22.0),
  );
  static SizedBox sizedBoxH23 = SizedBox(
    height: Dimensions.calcW(23.0),
  );
  static SizedBox sizedBoxH24 = SizedBox(
    height: Dimensions.calcW(24.0),
  );
  static SizedBox sizedBoxH25 = SizedBox(
    height: Dimensions.calcW(25.0),
  );
  static SizedBox sizedBoxH27 = SizedBox(
    height: Dimensions.calcW(27.0),
  );
  static SizedBox sizedBoxH28 = SizedBox(
    height: Dimensions.calcW(28.0),
  );
  static SizedBox sizedBoxH30 = SizedBox(
    height: Dimensions.calcW(30.0),
  );

  // SizedBox Width
  static SizedBox sizedBoxW5 = SizedBox(
    width: Dimensions.calcW(5.0),
  );
  static SizedBox sizedBoxW8 = SizedBox(
    width: Dimensions.calcW(8.0),
  );
  static SizedBox sizedBoxW10 = SizedBox(
    width: Dimensions.calcW(10.0),
  );
  static SizedBox sizedBoxW13 = SizedBox(
    width: Dimensions.calcW(13.0),
  );
  static SizedBox sizedBoxW15 = SizedBox(
    width: Dimensions.calcW(15.0),
  );
  static SizedBox sizedBoxW17 = SizedBox(
    width: Dimensions.calcW(17.0),
  );
  static SizedBox sizedBoxW18 = SizedBox(
    width: Dimensions.calcW(18.0),
  );
  static SizedBox sizedBoxW20 = SizedBox(
    width: Dimensions.calcW(20.0),
  );
  static SizedBox sizedBoxW22 = SizedBox(
    width: Dimensions.calcW(22.0),
  );
  static SizedBox sizedBoxW23 = SizedBox(
    width: Dimensions.calcW(23.0),
  );
  static SizedBox sizedBoxW24 = SizedBox(
    width: Dimensions.calcW(24.0),
  );
  static SizedBox sizedBoxW25 = SizedBox(
    width: Dimensions.calcW(25.0),
  );
  static SizedBox sizedBoxW27 = SizedBox(
    width: Dimensions.calcW(27.0),
  );
  static SizedBox sizedBoxW28 = SizedBox(
    width: Dimensions.calcW(28.0),
  );
  static SizedBox sizedBoxW30 = SizedBox(
    width: Dimensions.calcW(30.0),
  );
}

class AppSizedBoxHW extends StatelessWidget {
  final double? height;
  final double? width;
  const AppSizedBoxHW({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ?Get.size.height / height! :0.0,
      width: width != null ?Get.size.width / width! :0.0,
    );
  }
}
