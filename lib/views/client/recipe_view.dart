// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/controllers/recipe_controller.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';
import 'package:recipe_app/views/client/dashboard.dart';
import 'package:recipe_app/widgets/CustomAlertDialog.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';

class RecipeView extends StatefulWidget {
  final String name;
  final int id;

  const RecipeView({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final RecipeController _recipeController = RecipeController();
  late Recipe _recipe;

  @override
  void initState() {
    super.initState();
    _fetchRecipeDetails();
  }

  Future<void> _fetchRecipeDetails() async {
    try {
      _recipe = (await _recipeController.getRecipeById(widget.id))!;
      setState(() {});
    } catch (e) {
      debugPrint("Error fetching recipe details: $e");
    }
  }

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
                      Positioned.fill(
                        child: Image.network(
                          _recipe.imageFileName ?? 'https://fakeimg.pl/600x400',
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
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                          _recipe.name ?? 'Recipe Name',
                          style: GoogleFonts.paytoneOne(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 220.0, left: 20.0),
                        child: Text(
                          _recipe.createdBy ?? 'Created By',
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
                              '${_recipe.servings ?? 0} Servings',
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            SvgPicture.asset('assets/stopwatch.svg'),
                            SizedBox(width: 8),
                            Text(
                              '${_recipe.cookTime ?? 0} min',
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Add your logic for the edit button
                  },
                  label: Text(
                    'Edit',
                    style: GoogleFonts.lexend(),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    bool? confirmDelete = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Deletion'),
                          content: Text(
                              'Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(
                                    false); // Close the dialog and return false
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(
                                    true); // Close the dialog and return true
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirmDelete ?? false) {
                      await _recipeController.deleteRecipe(widget.id);

                      CustomAlertDialog.show(
                        context: context,
                        title: 'Deletion Successful',
                        message: 'The item has been deleted.',
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(
                            userId: widget.id.toString(),
                          ),
                        ),
                      );
                    }
                  },
                  label: Text('Delete'),
                )
              ],
            ),
            SizedBox(height: 18),
            Text(
              'Ingredients',
              style: GoogleFonts.paytoneOne(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Color(0xffCB4036),
              ),
            ),
            SizedBox(height: 18),
            Text(
              _recipe.ingredients ?? 'Ingredients data',
              style: GoogleFonts.lexend(),
            ),
            SizedBox(height: 18),
            Text(
              'Procedure',
              style: GoogleFonts.paytoneOne(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: Color(0xffCB4036),
              ),
            ),
            SizedBox(height: 18),
            Text(
              _recipe.procedure ?? 'Procedure data',
              style: GoogleFonts.lexend(),
            ),
          ],
        ),
      ),
    );
  }
}
