import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cartt",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //List of cart items
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 50,
                          ),
                          title: Text(
                            value.cartItems[index][0],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text('\$' + value.cartItems[index][1]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_forever_sharp),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //total + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade200,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$' + value.calculateTotal(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // pay now button
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.paypal_outlined,
                              size: 16,
                              color: Color.fromARGB(255, 248, 28, 28),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
