
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/product/products_controller.dart';
import 'package:trader_app/screens/shared_widgets/appbar_eng_view.dart';

class ProductDetails extends GetView<AllProductCtrl> {
  const ProductDetails({super.key});


   
  //           icon: SvgPicture.asset(
  //             "assets/icons/circle_close.svg",
  //             color: AppColors.kPrimaryDark,
  //           ),
  //         )
  //       ]

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(child:
     Scaffold(appBar: 
     AppBar_eng(title: AppStrings.PRODUCT_TITLE,showBackArrow: true,),
     body:buildbody(context) ,));
  }

    Widget buildbody(BuildContext context) {
    Widget w = CustomScrollView(
      slivers: [
        
        getBodyWidget(context),
      
      ],);
    return w;
    }
   Widget getBodyWidget(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(color: Colors.orange,),
          ),
        );
      } else {
        return SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,
                int index) {
              return getProductitems(index);
            }, childCount: controller.products.length));
      }
    }
    );
  }

  Widget getProductitems(int index) {
    Widget c = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      color: Colors.lightBlueAccent,
      child: Row(children: [
        const Icon(Icons.account_balance_sharp, size: 55,),
         Flexible(
          child: Container(
            padding: const EdgeInsets.only(left: 5.0), color: Colors.greenAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(controller.products[index].producTName.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.pink),),
                Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(children: [TextSpan(text: "MY Cost :",style: TextStyle(color: Colors.black,fontSize: 17)),
                        TextSpan(text: controller.products[index].producTCost
        .toString(),style: TextStyle(color: Colors.deepPurple,fontSize: 17))
                      ])),
                      // Text( "Cost :${controller.products[index].producTCost
                      //     .toString()}",),
                      Container(width: 5.0,),
                      Text("Selling Cost :${controller.products[index]
                          .sellinGCost
                          .toString()}")
                    ],),
                ),
                Text(controller.products[index].supplieRName.toString(),
                  style: TextStyle(fontSize: 12),),
              ],),
          ),
        )
      ], mainAxisAlignment: MainAxisAlignment.start,),);
    return c;
  }

}