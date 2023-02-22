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

import '../../Ui/products/add_product.dart';
import '../../models/menu_models.dart';
import '../../models/product_model.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        //appBar: buildAppBar_eng(false),
        appBar: AppBar(title: const Text("Daily Status")),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPictureSize: Size(75, 75),
                  // currentAccountPicture: CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       "https://appmaking.co/wp-content/uploads/2021/08/appmaking-logo-colored.png"),
                  // ),
                  accountName: Text("Ponsingh A"),
                  accountEmail: Text("kprtrader@gmail.com")),
              buildLeftDrawerView(context)
            ],
          ),
        ),
        body: SafeArea(
          child: buildbody(context),
        ));
  }

  Widget buildbody(BuildContext context) {
    Widget w = CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: gettitlewidget(),
        ),
        //getBodyWidget(context),SliverGridDelegateWithMaxCrossAxisExtent
        SliverGrid(
            delegate: SliverChildListDelegate([...getmenus(context)]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2)
                
                ),
                SliverToBoxAdapter(
          child: gettitlewidget(),
        ),
      ],
    );
    return w;
  }

  Widget gridView(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddProduct(),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: GridView.builder(
            itemCount: controller.dashboardmenu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1.50,
              crossAxisSpacing: 1.50,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      controller.dashboardmenu[index].menuIcon.icon,
                      size: 100.0,
                      color: Colors.white,
                    ),
                    Text(controller.dashboardmenu[index].menuName,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container gettitlewidget() {
    return Container(
      padding: EdgeInsets.all(1.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient:
            LinearGradient(colors: [Colors.yellow, Colors.lightBlueAccent]),
      ),
      child: Column(
        children: [
          Text(
            "KPR Trader Expense APP",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Tenkasi",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  List<Widget> getmenus(BuildContext context) {
    return controller.dashboardmenu
        .map((element) => GestureDetector(
              onTap: () {
                controller.onItemMenuClick(element);
                print(element.menuName);
              },
              // child: Container(padding: EdgeInsets.all(5),
              //   color:getColor() ,
              //   child: Column(mainAxisSize: MainAxisSize.max,

              //     children: [
              //     Icon(element.menuIcon.icon,size: 20,
              //     color: Colors.black,),
              //     Text(element.menuName,
              //         style: TextStyle(fontSize: 25, color: Colors.black),
              //         textAlign: TextAlign.center)
              //   ],),)

              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      element.menuIcon.icon,
                      size: 65.0,
                      color: Colors.white,
                    ),
                    Text(element.menuName,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ))
        .toList();
  }

  Color getColor() {
    Random random = Random();
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }

  ListView buildLeftDrawerView(BuildContext contextBase) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.drawerMenuItems.length,
        itemBuilder: (BuildContext context, int index) {
          if (controller.drawerMenuItems[index].submenu.isEmpty) {
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
                controller.onItemClick(controller.drawerMenuItems[index]);
              },
            );
          } else {
            return ExpansionTile(
              leading: controller.drawerMenuItems[index].menuIcon,
              title: Text(controller.drawerMenuItems[index].menuName),
              iconColor: Colors.orange,
              collapsedTextColor: Colors.black,
              textColor: Colors.black,
              collapsedIconColor: Colors.orange,
              children: getSubmenuWidgets(
                  controller.drawerMenuItems[index], contextBase),
            );
          }
        });
  }

  List<Widget> getSubmenuWidgets(MenuItems m, BuildContext contextBase) {
    List<Widget> collection = [];
    for (var submenu in m.submenu) {
      Widget tile = ListTile(
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
          controller.onSubItemClick(submenu);
        },
      );

      collection.add(tile);
    }
    return collection;
  }

  AppBar buildAppBar_eng(bool isnormal) {
    if (isnormal) {
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
        ],
      );
    } else {
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
