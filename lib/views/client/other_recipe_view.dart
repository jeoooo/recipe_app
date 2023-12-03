// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/views/client/update_recipe.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';

class OtherRecipeView extends StatelessWidget {
  final name;
  final token;
  final id;
  const OtherRecipeView(
      {super.key, required this.name, required this.token, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CookyAppBar(color: Color(0xffCB4036)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      // Use Stack and Positioned.fill for the image and gradient
                      Positioned.fill(
                        child: Image.network(
                          'https://fakeimg.pl/600x400',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7)
                              ],
                            ),
                          ),
                        ),
                      ),
                      FilledButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24.0,
                        ),
                        label: Text(
                          'Back to Feed',
                          style: GoogleFonts.lexend(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180.0, left: 20.0),
                        child: Text(
                          'data',
                          style: GoogleFonts.paytoneOne(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 220.0, left: 20.0),
                        child: Text(
                          'data',
                          style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 250.0, left: 20.0, bottom: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/utensils.svg'),
                            SizedBox(width: 8),
                            Text(
                              '4 Servings',
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset('assets/stopwatch.svg'),
                            SizedBox(width: 8),
                            Text(
                              '4 Servings',
                              style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Add your logic for the first button
                    MaterialPageRoute(
                        builder: (context) => UpdateRecipe(id: id, name: name));
                  },
                  label: Text(
                    'Edit',
                    style: GoogleFonts.lexend(),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Add your logic for the first button
                  },
                  label: Text(
                    'Edit',
                    style: GoogleFonts.lexend(),
                  ),
                ),
              ],
            ),
            Text(
              'Ingredients',
              style: GoogleFonts.paytoneOne(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Color(0xffCB4036)),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'data',
              style: GoogleFonts.lexend(),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Procedure',
              style: GoogleFonts.paytoneOne(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Color(0xffCB4036)),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'data',
              style: GoogleFonts.lexend(),
            ),
          ],
        ),
      ),
    );
  }
}
