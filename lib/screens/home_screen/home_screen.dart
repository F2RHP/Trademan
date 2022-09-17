import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/homescreen_controller.dart';
import 'package:trader_app/controllers/invoices_controller.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/home_screen/widgets/invoice_english_view.dart';
import 'package:trader_app/screens/shared_widgets/appbar_eng_view.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/homescreen_controller.dart';

import '../../models/menu_models.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        appBar: buildAppBar_eng(false),
       drawer: Drawer(
         child: ListView(children: [
           UserAccountsDrawerHeader(
             currentAccountPictureSize: Size(75,75),
           currentAccountPicture: CircleAvatar(
             backgroundImage: NetworkImage(
                 "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
           ),
               accountName: Text("Ponsingh A"),
               accountEmail: Text("kprtrader@gmail.com")),

           buildLeftDrawerView(context)

         ],),
       ),
        body: SafeArea(
          child: Center(child: Text("Tradet"),),
        ));
  }

  ListView buildLeftDrawerView(BuildContext contextBase) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.drawerMenuItems.length,
        itemBuilder: (BuildContext context, int index) {

          if(controller.drawerMenuItems[index].submenu.isEmpty) {
            return ListTile(

              // selected:(  index== menuItemsController.getIndex),
              leading: controller.drawerMenuItems[index].menuIcon,
              title: Text(controller.drawerMenuItems[index].menuName),
              // selectedColor: Colors.blue,
              iconColor: Colors.orange,
              selectedTileColor: Colors.lime,
              // tileColor: Colors.deepPurpleAccent,
              onTap: () {
                Navigator.pop(contextBase);
                controller.onItemClick(controller.drawerMenuItems[index]
                );
              },
            );
          }
          else{
            return ExpansionTile(
              leading: controller.drawerMenuItems[index].menuIcon,
              title: Text(controller.drawerMenuItems[index].menuName),
              iconColor: Colors.orange,
              collapsedTextColor: Colors.black,
              textColor: Colors.black,
              collapsedIconColor:  Colors.orange,
              children: getSubmenuWidgets(controller.drawerMenuItems[index],contextBase),

            );
          }
        }
    );
  }

  List<Widget> getSubmenuWidgets(MenuItems m,BuildContext contextBase)
  {
    List<Widget> collection=[];
    for (var submenu in m.submenu) {


      Widget tile= ListTile(

        // selected:(  index== menuItemsController.getIndex),
        leading: submenu.subMenuicon,

        title: Text(submenu.subMenuName),
        // selectedColor: Colors.blue,
        iconColor: Colors.green,

        selectedTileColor: Colors.lime,
        // tileColor: Colors.deepPurpleAccent,
        contentPadding: EdgeInsets.only(left: 30),
        // tileColor: Colors.deepPurpleAccent,
        onTap: () {
          Navigator.pop(contextBase);
          controller.onSubItemClick(submenu
          );
        },
      );

      collection.add(tile);
    }
    return collection;
  }

  // void Test()
  // {
  //   Obx(() {
  //     if (controller.invoicesList.isEmpty) {
  //       return Center(
  //         child: CustomText(
  //           text: AppStrings.HOME_NO_INVOICES,
  //           color: Colors.black,
  //           fontSize: Dimensions.calcH(20),
  //           weight: FontWeight.w600,
  //         ),
  //       );
  //     } else {
  //       return Column(
  //         children: [
  //           ...controller.invoicesList
  //               .map((invoice) => InvoiceView_eng(
  //             invoice: invoice,
  //           ))
  //               .toList()
  //         ],
  //       );
  //     }
  //   })
  // }
  
  AppBar buildAppBar_eng(bool isnormal) {
    if(isnormal) {
      return AppBar_eng(
       
        title: AppStrings.HOME_TITLE,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed("/new");
            },
            splashColor: AppColors.kSecondaryColor,
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              "assets/icons/new_invoice.svg",
              height: Dimensions.calcH(25),
              color: AppColors.kPrimaryDark,
            ),
          ),
          SizedBox(
            width: Dimensions.calcW(15),
          ),
          // InkWell(
          //   onTap: () {},
          //   splashColor: AppColors.kSecondaryColor,
          //   customBorder: const CircleBorder(),
          //   child: SvgPicture.asset(
          //     "assets/icons/settings.svg",
          //     height: Dimensions.calcH(30),
          //     color: AppColors.kPrimaryDark,
          //   ),
          // ),
          // SizedBox(
          //   width: Dimensions.calcW(8),
          // ),
        ],
      );
    }
    else
      {
        return AppBar(title: Text(AppStrings.HOME_TITLE),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(55.0),
            // ),
            actions: [
          InkWell(
            onTap: () {
              Get.toNamed("/new");
            },
            splashColor: AppColors.kSecondaryColor,
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              "assets/icons/new_invoice.svg",
              height: Dimensions.calcH(25),
              color: AppColors.kPrimaryDark,
            ),
          ),
          SizedBox(
            width: Dimensions.calcW(15),
          ),
          // InkWell(
          //   onTap: () {},
          //   splashColor: AppColors.kSecondaryColor,
          //   customBorder: const CircleBorder(),
          //   child: SvgPicture.asset(
          //     "assets/icons/settings.svg",
          //     height: Dimensions.calcH(30),
          //     color: AppColors.kPrimaryDark,
          //   ),
          // ),
          // SizedBox(
          //   width: Dimensions.calcW(8),
          // ),
        ]);
      }
  }
}
