import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/screens/Animation/FadeAnimation.dart';
import 'package:login/screens/cart.dart';
import 'package:login/screens/sidebar/pages/homepage.dart';
import 'package:login/screens/sidebar/sidebar_layout.dart';


class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidgetPageViewHeader(),
          Align(
            alignment: Alignment.bottomCenter,
            child: WidgetDescription(),
          ),
          SafeArea(
            minimum: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed:(){
                       Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>SideBarLayout())
                       );
                    },
                    
                  ),
                  
                  SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                    icon: const Icon(Icons.shopping_basket),
                    color: Colors.white,
                    onPressed:(){
                       Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>MyCart())
                       );
                      },
                    
                     ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WidgetPageViewHeader extends StatefulWidget {
  @override
  _WidgetPageViewHeaderState createState() => _WidgetPageViewHeaderState();
}

class _WidgetPageViewHeaderState extends State<WidgetPageViewHeader> {
  final listImageHeader = [
    'assets/images/shirt.jpg',
    'assets/images/shirt.jpg',
    'assets/images/shirt.jpg',
    'assets/images/shirt.jpg',
  ];
  int _indexHeader = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var heightImage = mediaQuery.size.height / 1.5;
    return  Container(
      height: heightImage,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Image.asset(
                listImageHeader[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: listImageHeader.length,
            onPageChanged: (index) {
              setState(() {
                _indexHeader = index;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQuery.size.height / 1.9,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < listImageHeader.length; i++)
                  if (i == _indexHeader) circleBar(true) else circleBar(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 16 : 12,
      width: isActive ? 16 : 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        border: isActive ? Border.all(color: Colors.white) : null,
      ),
      padding: EdgeInsets.all(isActive ? 4.0 : 0.0),
      child: Container(
        width: isActive ? 8 : 16,
        height: isActive ? 8 : 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
      ),
    );
  }
}

class WidgetDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height / 2.3,
      width: double.infinity,
      child: FadeAnimation(1,Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
     

      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 40.0, right: 24.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView(
                  padding: EdgeInsets.only(
                      bottom: mediaQuery.size.height -
                          mediaQuery.size.height / 1.1 +
                          16.0),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildWidgetProductName(context),
                        _buildWidgetProductPrice(context),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Divider(
                            height: 2.0,
                            color: Colors.black,
                          ),
                        ),
                        WidgetChooseColor(),
                        SizedBox(height: 16.0),
                        WidgetChooseSize(),
                        _buildWidgetProductInfo(context),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: WidgetAddToBag(),
          ),
        ],
      ),
       )),
    );
  }

  Widget _buildWidgetProductPrice(BuildContext context) {
    return Text(
      'Rs.500',
      style: Theme.of(context).textTheme.body1.merge(TextStyle(fontSize: 16.0)),
    );
  }

  Widget _buildWidgetProductName(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                'COMBO OF 5 SHIRTS',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Icon(Icons.share),
                SizedBox(height: 10.0),
                Icon(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWidgetProductInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'lenin shirts , '
                  'best selections ',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .merge(TextStyle(fontSize: 16.0)),
            ),
            TextSpan(
                text: 'More',
                style: Theme.of(context).textTheme.body1.merge(
                      TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class WidgetChooseColor extends StatefulWidget {
  final List<String> colorsName = [
    'Navy',
    'Milo',
    'Maroon',
    'Grey',
  ];
  final List<Color> colors = [
    Color(0xFF221D33),
    Color(0xFFD7BA97),
    Color(0xFF9C606C),
    Color(0xFFA8BCBD),
  ];

  @override
  _WidgetChooseColorState createState() => _WidgetChooseColorState();
}

class _WidgetChooseColorState extends State<WidgetChooseColor> {
  int _indexSelected;

  @override
  void initState() {
    _indexSelected = widget.colors.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Color: ',
                style: TextStyle(color: Colors.black87),
              ),
              TextSpan(
                text: widget.colorsName[_indexSelected],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 24.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              itemCount: widget.colors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _indexSelected = index;
                      });
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: widget.colors[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: _indexSelected == index ? 4.0 : 0.0,
                        ),
                        boxShadow: [
                          _indexSelected == index
                              ? BoxShadow(
                                  color: Color(0xFF757575),
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 4.0),
                                )
                              : BoxShadow(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetChooseSize extends StatefulWidget {
  final List<String> listSize = [
    'XL',
    'S',
    'M',
    'L',
  ];

  @override
  _WidgetChooseSizeState createState() => _WidgetChooseSizeState();
}

class _WidgetChooseSizeState extends State<WidgetChooseSize> {
  int _indexSelected;

  @override
  void initState() {
    _indexSelected = widget.listSize.length - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Size: ',
                style: TextStyle(color: Colors.black87),
              ),
              TextSpan(
                text: widget.listSize[_indexSelected],
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 24.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              itemCount: widget.listSize.length,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Text(widget.listSize[index]),
                    Radio(
                      value: index,
                      groupValue: _indexSelected,
                      activeColor: Color(0xFF32312D),
                      onChanged: (index) {
                        setState(() {
                          _indexSelected = index;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetAddToBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: 60,
      width: 300,
      child: Material(
        type: MaterialType.canvas,
        color: Colors.cyan,
      
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        

        ),
        child: InkWell(
          onTap: () {
            showBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return MyCart();
              },
            );
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    'Add to cart ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

