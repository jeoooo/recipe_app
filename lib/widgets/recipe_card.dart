import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeCard extends StatelessWidget {
  final String recipeName;
  const RecipeCard({
    super.key,
    required this.recipeName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: 325, // Set the width of the card to 325 pixels
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network('https://fakeimg.pl/325x150')),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    color: Color(0xffFFC327),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(recipeName,
                        style: GoogleFonts.lexend(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
