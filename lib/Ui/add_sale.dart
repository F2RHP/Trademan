import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class AddSale extends StatefulWidget {
  const AddSale({Key? key}) : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: CustomPadding.padding18,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: CustomPadding.padding20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: AppColors.greyLight),
              ),
              child: Text(
                '+ ${AppStrings.chooseCustomer}',
                style: TextStyle(
                  color: AppColors.blueAccentShade700,
                  fontSize: 16.0,
                ),
              ),
            ),
            AppSizedBox.sizedBoxH15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: CustomPadding.padding14,
                    child: Text(
                      '+ ${AppStrings.addProduct}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: CustomPadding.padding14,
                  decoration: BoxDecoration(
                    borderRadius: CustomBorderRadius.borderRadius5,
                    color: AppColors.greyLight,
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: const Text(
                    '2023-02-25',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            AppSizedBox.sizedBoxH15,
            FittedBox(
              child: DataTable(
                columnSpacing: 10.0,
                dataRowHeight: 70.0,
                headingRowHeight: 30.0,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) {
                    return const Color(0xFFE7E7E7);
                  },
                ),
                columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text('No.'),
                  ),
                  DataColumn(
                    label: Text('Details'),
                  ),
                  DataColumn(
                    label: Text('Qty'),
                  ),
                  DataColumn(
                    label: Text('Prices'),
                  ),
                  DataColumn(
                    label: Text('Total'),
                  ),
                  DataColumn(
                    label: Text(''),
                  ),
                ],
                rows: List.generate(
                  getValues.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        SvgPicture.asset(
                          'assets/icons/pen.svg',
                          height: 20.0,
                        ),
                      ),
                      DataCell(
                        Text(getValues[index]['no']),
                      ),
                      DataCell(
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            getValues[index]['details'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(getValues[index]['qty']),
                      ),
                      DataCell(
                        Text(getValues[index]['prices']),
                      ),
                      DataCell(
                        Text(getValues[index]['total']),
                      ),
                      DataCell(
                        SvgPicture.asset('assets/icons/pen.svg', height: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Table(
              children: const [
                TableRow(children: [
                  TableCell(
                    child: SizedBox(
                      width: 200.0,
                    ),
                  ),
                  TableCell(
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      '1000',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            const Divider(),
            const Text('Discount'),
            Switch(
                activeColor: Colors.green, value: true, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 40.0,
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        AppStrings.addSale,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }
}

List getValues = [
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  }
];
