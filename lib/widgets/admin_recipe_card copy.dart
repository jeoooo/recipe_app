// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/admin/admn_recipe_view.dart';

class AdminRecipeCard extends StatelessWidget {
  final id;
  final name;
  final token;
  final auth_id;
  final String recipeName;
  final String image;
  const AdminRecipeCard(
      {Key? key,
      required this.id,
      required this.recipeName,
      required this.image,
      required this.auth_id,
      required this.name,
      required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AdminRecipeView(
                      id: id,
                      auth_id: auth_id,
                      name: name,
                      token: token,
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
