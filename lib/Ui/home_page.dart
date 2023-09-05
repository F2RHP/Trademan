import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_app/Ui/color_code.dart';
import 'package:trader_app/Ui/tast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool favourite = false;

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCode.lightBackground,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){},
          child: Column(
            children: [
              topTitle(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: ColorCode.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                CommonCode.shadowColor,
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: SvgPicture.asset(
                              height: 90.0,
                              width: 90.0,
                              'assets/icons/jadieFullColorIcon.svg',
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          'Smoothies',
                          style: TextStyle(
                            color: ColorCode.backgroundColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Specialities',
                      style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    slideViewWidget(),
                    const SizedBox(height: 10.0),
                    Text(
                      'All products',
                      style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 22.0,
                      ),
                    ),
                    listView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(50.0),),
        child: Drawer(
          backgroundColor: ColorCode.lightBackground,
          width: MediaQuery.of(context).size.width - 60,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 210.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                          color: ColorCode.lightYellow,
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80.0),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0,bottom: 20.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: ColorCode.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              CommonCode.shadowRadiusColor,
                            ]
                          ),
                          
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sakthy',style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('Flutter Developer',style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),),
                      const SizedBox(height: 60.0),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.ac_unit,color: ColorCode.backgroundColor,),
                          const SizedBox(width: 13.0),
                          Text('Flutter Developer',style: TextStyle(
                            color: ColorCode.backgroundColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    );
                  },),
                ),
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  //Back Layer
                  Container(
                    height: 270.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(50.0)),
                      color: ColorCode.lightYellow,
                    ),
                  ),
                  //bottom app version SVG
                  Container(
                    height: 70.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40.0)),
                      color: ColorCode.darkYellow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: SvgPicture.asset('assets/images/smoofy_version.svg',alignment: Alignment.topRight),
                    ),
                  ),
                  //side Green Layer
                  Container(
                    height: 200.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(50.0)),
                      color: ColorCode.backgroundColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 120.0,
                width: 180.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: ColorCode.darkYellow,
                      width: 4.0,
                    ),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/f3.jpg'))),
              ),
              const SizedBox(width: 10.0),
              SizedBox(
                width: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smoothie',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Dessert',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorCode.backgroundColor,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '58,29\$',
                        style: TextStyle(
                          color: ColorCode.backgroundColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        favourite = !favourite;
                      });
                    },
                    child: Icon(
                      favourite ? Icons.favorite_border : Icons.favorite,
                      color: ColorCode.favouriteColor,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: SvgPicture.asset('assets/images/starshape.svg',
                            height: 40.0),
                      ),
                      Text(
                        counter.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorCode.white,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget slideViewWidget() {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/f2.jpg'),
                    ),
                    boxShadow: [
                      CommonCode.shadowRadiusColor,
                    ],
                    border: Border.all(
                      color: ColorCode.backgroundColor,
                      // strokeAlign: StrokeAlign.inside,
                      width: 3.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: ColorCode.backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'Red power',
                      style: TextStyle(
                        color: ColorCode.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget topTitle(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: const Alignment(0.85, -0.10),
          height: 180.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorCode.lightYellow,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(60.0),
            ),
          ),
          child: SvgPicture.asset('assets/icons/person.svg'),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          height: 120.0,
          width: 180.0,
          decoration: BoxDecoration(
            color: ColorCode.darkYellow,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(60.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
            child: SvgPicture.asset('assets/images/smoofyText.svg'),
          ),
        )
      ],
    );
  }
}
