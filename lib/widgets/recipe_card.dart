import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/admin/admin_recipe_view.dart';

class RecipeCard extends StatelessWidget {
  final int id;
  final String name;
  final String recipeName;
  final String image;

  const RecipeCard({
    Key? key,
    required this.id,
    required this.recipeName,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminRecipeView(
              id: id,
              name: name,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                height: 150, // Adjusted height for the image
                width: double.infinity, // Make the image take full width
                fit: BoxFit.cover, // Cover the entire container
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Text(
                recipeName,
                style: GoogleFonts.lexend(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Show a maximum of 2 lines for the recipe name
              ),
            ),
          ],
        ),
      ),
    );
  }
}
