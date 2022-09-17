import 'package:flutter/material.dart';
class MenuItems
{
  String menuName='';
  String menuKey='';
  Icon menuIcon=const Icon(Icons.menu_book) ;
  List<SubMenuItem> submenu=[];

  MenuItems(@required this.menuName,@required this.menuKey,@required this.menuIcon);
}

class SubMenuItem
{
  String subMenuName='';
  String subMenuKey='';
  Icon subMenuicon=const Icon(Icons.menu_book) ;

  SubMenuItem(@required this.subMenuName,@required this.subMenuKey,@required this.subMenuicon);
}