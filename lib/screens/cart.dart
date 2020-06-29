import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetMyCart extends StatefulWidget {
  @override
  _WidgetMyCartState createState() => _WidgetMyCartState();
}

class _WidgetMyCartState extends State<WidgetMyCart> {
  List<Cart> listMyCart = [];

  @override
  void initState() {
    listMyCart
      ..add(Cart(
          productName: 'blue shirt',
          price: 89000,
          size: 'M',
          quantity: 1,
          color: 'Black',
          image: 'assets/images/shirt.jpg'))
      ..add(Cart(
          productName: 'black shirt',
          price: 159000,
          size: 'L',
          quantity: 1,
          color: 'Maroon',
          image: 'assets/images/shirt.jpg'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Container(
        height: mediaQuery.height / 2.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48.0),
            topRight: Radius.circular(48.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 40.0,
            right: 24.0,
            bottom: 20.0,
          ),
          child: Column(
            children: <Widget>[
              _buildWidgetHeaderMyCart(context),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Divider(
                  height: 2.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: listMyCart.length,
                  itemBuilder: (context, index) {
                    Cart cart = listMyCart[index];
                    String rupiahPrice = "100";
                        
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            cart.image,
                            width: 48.0,
                            height: 48.0,
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Wrap(
                              direction: Axis.vertical,
                              children: <Widget>[
                                Text(
                                  cart.productName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                                Text(
                                  'Rp $rupiahPrice',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .merge(TextStyle(fontSize: 12.0)),
                                ),
                                Text(
                                  'Size: ${cart.size}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .merge(TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          WidgetControllerQuantity(cart.quantity),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2.0,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Divider(
                  thickness: 2.0,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total amount',
                      style: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: Colors.grey),
                          )),
                  Text('Rp 248.000',
                      style: Theme.of(context).textTheme.body1.merge(
                            TextStyle(fontWeight: FontWeight.w600),
                          )),
                ],
              ),
              SizedBox(height: 8.0),
              SizedBox(
                width: mediaQuery.width,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Check out',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  color: Color(0xFF32312D),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetHeaderMyCart(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'My Cart',
          style: Theme.of(context).textTheme.body1.merge(TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              )),
        ),
        Text('2 items', style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}


class WidgetControllerQuantity extends StatefulWidget {
  final int qty;

  WidgetControllerQuantity(this.qty);

  @override
  _WidgetControllerQuantityState createState() =>
      _WidgetControllerQuantityState();
}

class _WidgetControllerQuantityState extends State<WidgetControllerQuantity> {
  int qty;

  @override
  void initState() {
    qty = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (qty == 1) return;
            setState(() {
              qty -= 1;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.remove,
              size: 20.0,
              color: Colors.black54,
            ),
          ),
        ),
        Text('$qty'),
        GestureDetector(
          onTap: () {
            if (qty == 10) return;
            setState(() {
              qty += 1;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.add,
              size: 20.0,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class Cart {
  String productName;
  int price;
  String size;
  int quantity;
  String color;
  String image;

  Cart(
      {this.productName,
      this.price,
      this.size,
      this.quantity,
      this.color,
      this.image});
}
