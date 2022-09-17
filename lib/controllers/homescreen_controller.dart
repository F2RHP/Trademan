//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/menu_models.dart';


class HomeScreenController extends GetxController
{
  List<MenuItems> drawerMenuItems=[];

  @override
  void onInit() {
    super.onInit();
    drawerMenuItems=getmenuItems();

  }

  void onItemClick(MenuItems m)
  {
    //_selectedIndex.value=m.getMenuItems().indexOf(m);
    print(m.menuName);

  }
  void onSubItemClick(SubMenuItem m) {
  print(m.subMenuName);
  }

  List<MenuItems> getmenuItems()
  {
    List<MenuItems> menuItems=[];
    menuItems.add(MenuItems('Home','Home',const Icon(Icons.home)));
    MenuItems m=MenuItems('Master','Master' ,const Icon(Icons.lock_clock));
    m.submenu.add(SubMenuItem('Customer','Customer' ,const Icon(Icons.supervised_user_circle_rounded)));
    m.submenu.add(SubMenuItem('Supplier','Supplier' ,const Icon(Icons.lock_clock)));
    menuItems.add(m);
    menuItems.add(MenuItems('Users','Users',const Icon(Icons.person)));
    menuItems.add(MenuItems('Settings','Settings',const Icon(Icons.settings)));
    menuItems.add(MenuItems('Feedback','Feedback',const Icon(Icons.feedback)));
    return menuItems;
  }
}