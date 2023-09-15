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
    // {
    //   'icons': Icons.groups_rounded,
    //   'name': 'addProduct',
    // },
    {
      'icons': Icons.production_quantity_limits_rounded,
      'caption':'Product',
      'name': 'allProduct',
    },
    {
      'icons': Icons.face,
      'caption':'Customer',
      'name': 'customerReg',
    },
    {
      'icons': Icons.account_balance_outlined,
      'caption':'Expenses',
      'name': 'addExpense',
    },
        {
      'icons': Icons.sell_outlined,
      'caption':'Sale',
      'name': 'addSale',
    },
            {
      'icons': Icons.currency_rupee,
      'caption':'Cash Transaction',
      'name': 'cashTransaction',
    },
                {
      'icons': Icons.money_off_csred_sharp,
      'caption':'Goods Order',
      'name': 'productTransaction',
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
                    Text(dailySalesRecord[index]['caption'],
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
      title: Text(
        'Daily Sales Record',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 24.0,
        ),
      ),
      centerTitle: true,
      actions:   <Widget>[
        GestureDetector(
          child:const Icon(
            Icons.help_center,
            color: Colors.white,
          ),
          onTap: (){
              showAboutDialog(
                context: context,
                applicationName: 'KPR Trader',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 Your Organization',
                children: [
                  const Text('Developer: Ponsingh ,Jeba ,Sakthi'),
                  const Text('Contact: 7708934748'),
                ],
              );
            },
        ),
        SizedBox(width: 20.0),
      ],
    );
  }

  List router =[

  ];
}
