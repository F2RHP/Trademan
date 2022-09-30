//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/menu_models.dart';
import 'package:trader_app/services/productservice.dart';
import 'package:trader_app/models/product_model.dart';
class HomeScreenController extends GetxController
{
  final isLoading=false.obs;
  List<MenuItems> drawerMenuItems=[];
   final  products=[].obs;
   var dashboardmenu=<DashboardMenu>[].obs;
  @override
  void onInit() async {
    isLoading.value=true;
    super.onInit();
    drawerMenuItems = getmenuItems();
    dashboardmenu.value = getDashboardMenus();
    products.value = await ProductService().getAllProducts();
    isLoading.value=false;
  }

  void onItemClick(MenuItems m)
  {
    //_selectedIndex.value=m.getMenuItems().indexOf(m);
    print(m.menuName);

  }
  void onSubItemClick(SubMenuItem m) {
  print(m.subMenuName);
  }
List<DashboardMenu> getDashboardMenus()
{

  List<DashboardMenu> menu=[];
  menu.add(DashboardMenu.create("Sales",Icon(Icons.monetization_on) ));
  menu.add(DashboardMenu.create("Purchase Order",Icon(Icons.fire_truck) ));
  menu.add(DashboardMenu.create("Products",Icon(Icons.production_quantity_limits) ));
  menu.add(DashboardMenu.create("Customer",Icon(Icons.man) ));
  menu.add(DashboardMenu.create("Expense",Icon(Icons.exit_to_app_rounded) ));
  menu.add(DashboardMenu.create("Supplier",Icon(Icons.man_sharp) ));
  menu.add(DashboardMenu.create("Report",Icon(Icons.report) ));

  return menu;
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