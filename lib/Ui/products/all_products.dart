import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<String> list = ['1', '2', '3', '4'];
  var dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topSection(),
            AppSizedBox.sizedBoxH20,
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const GroupButton(
                  options: GroupButtonOptions(
                    spacing: 0,
                    buttonWidth: 100,
                    buttonHeight: 50,
                    selectedColor: Color(0x960BE88C),
                    unselectedColor: Colors.blueAccent,
                  ),
                  buttons: <String>['All', 'In Stock', 'Stock Out']),
            ),
            AppSizedBox.sizedBoxH20,
            Container(
              padding: const EdgeInsets.all(15.0,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                border: Border.all(color: Colors.black,),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.account_box_outlined,size: 50.0,)),
                  AppSizedBox.sizedBoxW15,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        AppSizedBox.sizedBoxH15,
                        Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  text: 'Cost: ',
                                  children: [
                                    TextSpan(
                                        text: '453',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                            ),
                            AppSizedBox.sizedBoxW15,
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  text: 'Sell: ',
                                  children: [
                                    TextSpan(
                                        text: '1000',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]),
                            ),
                          ],
                        ),
                        AppSizedBox.sizedBoxH15,
                        const Text(
                          'Product Description Product DescriptionProduct DescriptionProduct Description',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        AppSizedBox.sizedBoxH15,
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(18.0)),
                              child: const Text(
                                '211.00 Pack',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            AppSizedBox.sizedBoxW8,
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(18.0)),
                              child: const Text(
                                '21',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              '4 month ago',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topSection() {
    return Column(
      children: [
        const KPRTraders(),
        SizedBox(height: Dimensions.calcH(20.0)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: Dimensions.calcH(10.0)),
              Text(
                'All',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              Text(
                'In Stock',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              Text(
                'Stock Out',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              Text(
                'A-Z',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(10.0)),
            ],
          ),
        ),
        SizedBox(height: Dimensions.calcH(10.0)),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(height: Dimensions.calcH(15)),
        DropdownButtonFormField(
          value: dropDownValue,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text('product'),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ),
        SizedBox(height: Dimensions.calcH(15)),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Search...',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
