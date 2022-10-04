import 'dart:math';

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
import '../../models/product_model.dart';

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
          child:Buildbody(context),
        ));
  }

  Widget Buildbody(BuildContext context) {
    Widget w = CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: gettitlewidget(),),
        GetBodyWidget(context),
        SliverGrid(
            delegate: SliverChildListDelegate([...getmenus()]),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2, crossAxisSpacing: 2, mainAxisSpacing: 2))
      ],);
    return w;
  }



  Container gettitlewidget() {
    return Container(padding: EdgeInsets.all(1.0), width: double.maxFinite,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),

            gradient:
            LinearGradient(colors: [Colors.yellow, Colors.lightBlueAccent]),),
          child: Column(children: [
            Text("KPR Trader Expense APP",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
            Text("Tenkasi",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,)
          ],
          ),
        );
  }



  List<Container> getmenus() {
    return controller.dashboardmenu.map((element) =>
        Container(padding: EdgeInsets.all(16),
          color:getColor() ,
          child: Column(children: [
            Icon(element.menuIcon.icon, size: 80,
            color: Colors.black,),
            Text(element.menuName,
                style: TextStyle(fontSize: 30, color: Colors.black),
                textAlign: TextAlign.center)
          ],),)).toList();
  }

  Color getColor() {
    Random random = Random();
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
  Widget GetBodyWidget(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return SliverToBoxAdapter(
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
        Icon(Icons.account_balance_sharp, size: 55,),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 5.0), color: Colors.greenAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(controller.products[index].producTName.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.pink),),
                Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(children: [TextSpan(text: "Cost :",style: TextStyle(color: Colors.black,fontSize: 17)),
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
