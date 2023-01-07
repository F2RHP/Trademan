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
           const UserAccountsDrawerHeader(
              currentAccountPictureSize:  Size(75,75),
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
          child:buildbody(context),
        ));
  }

  Widget buildbody(BuildContext context) {
    Widget w = CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: gettitlewidget(),),
        // getBodyWidget(context),
        SliverGrid(
            delegate: SliverChildListDelegate([...getmenus(context)]),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3, crossAxisSpacing: 2, mainAxisSpacing: 2))
      ],);
    return w;
  }



  Container gettitlewidget() {
    return Container(padding: EdgeInsets.all(1.0), width: double.maxFinite,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0),

            gradient:
            LinearGradient(colors: [Colors.yellow, Colors.lightBlueAccent]),),
          child:  Column(children: [
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



  List<Container> getmenus(BuildContext context) {
    
   
    return controller.dashboardmenu.map((element) =>
        Container(padding: EdgeInsets.all(5),
          color:getColor() ,
          child: Column(mainAxisSize: MainAxisSize.max,
          
            children: [
            Icon(element.menuIcon.icon,size: 20,
            color: Colors.black,),
            Text(element.menuName,
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center)
          ],),)).toList();
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
