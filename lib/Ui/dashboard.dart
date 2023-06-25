import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/controllers/dash_board_ctrl.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List dailySalesRecord = [
    {
      'icons': Icons.groups_rounded,
      'name': 'addProduct',
    },
    {
      'icons': Icons.account_box_outlined,
      'name': 'allProduct',
    },
    {
      'icons': Icons.satellite_alt,
      'name': 'addSale',
    },
    {
      'icons': Icons.face,
      'name': 'customerReg',
    },
    {
      'icons': Icons.account_balance_outlined,
      'name': 'addExpense',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: appBar(),
      body: gridView(),
      floatingActionButton: FloatingActionButton(
        // onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpense(),)),
        onPressed: () {
          getAssetFiles();
        },
        backgroundColor: AppColors.red,
        child: const Icon(Icons.speed),
      ),
    );
  }
  getAssetFiles() async {
    final assetFiles = await rootBundle.loadString('AssetManifest.json');
    debugPrint(assetFiles);
  }

  Widget gridView() {
    return Padding(
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
            return GestureDetector(
              onTap: (){
                DashBoardCtrl().onItemClick(dailySalesRecord[index]['name'],context                   );
              },
              child: Container(
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
                        ),),
                  ],
                ),
              ),
            );
          },
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
      actions:  const <Widget>[
        Icon(
          Icons.help_outline,
          color: Colors.white,
        ),
        SizedBox(width: 20.0),
      ],
    );
  }

  List router =[

  ];
}
