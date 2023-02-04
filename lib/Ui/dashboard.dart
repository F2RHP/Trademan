import 'package:flutter/material.dart';
import 'package:trader_app/Ui/Expense/add_expense.dart';
import 'package:trader_app/Ui/add_product.dart';
import 'package:trader_app/constants/colors.dart';

class ColorCodes {
  static Color primary = const Color(0xFF1eb060);
  static Color redColor = Colors.red;
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List dailySalesRecord = [
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
    {
      'icons': Icons.groups_rounded,
      'name': 'Customers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: appBar(),
      body: gridView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpense(),)),
        backgroundColor: AppColors.red,
        child: const Icon(Icons.speed),
      ),
    );
  }

  Widget gridView() {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProduct(),)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: GridView.builder(
            itemCount: dailySalesRecord.length,
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
                      dailySalesRecord[index]['icons'],
                      size: 100.0,
                      color: Colors.white,
                    ),
                    Text(dailySalesRecord[index]['name'],
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

  AppBar appBar() {
    return AppBar(
      leading: const Icon(Icons.menu_outlined),
      title: const Text(
        'Daily Sales Record',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      centerTitle: true,
      actions: const <Widget>[
        Icon(
          Icons.help_outline,
          color: Colors.white,
        ),
        SizedBox(width: 20.0),
      ],
    );
  }
}
