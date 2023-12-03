// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/admin/admin_recipe_view.dart';

class RecipeCard extends StatelessWidget {
  final id;
  final name;

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
                    )));
      },
      child: Card(
        elevation: 0,
        // ignore: sized_box_for_whitespace
        child: Container(
          width: 325, // Set the width of the card to 325 pixels
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                // 'https://fakeimg.pl/325x150'
                child: Image.network(image),
              ),
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
                      child: Text(
                        recipeName,
                        style: GoogleFonts.lexend(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
