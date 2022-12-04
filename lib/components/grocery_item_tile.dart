import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemTile extends StatelessWidget {
  GroceryItemTile({
    required this.color,
    required this.imagePath,
    required this.itemName,
    required this.itemPrice,
    required this.onPressed,
  });
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Image.asset(
              imagePath,
              height: 65,
            ),

            // item name
            Text(itemName),
            // price +Button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$' + itemPrice,
                style: GoogleFonts.abhayaLibre(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
