// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import '../../widgets/add_recipe_fab.dart';

class Dashboard extends StatefulWidget {
  final String userId;

  Dashboard({Key? key, required this.userId}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool ownRecipesSelected = true;
  List<Map<String, dynamic>> recipeList = []; // Store the list of recipes

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    try {
      // Fetch recipes from the database based on user and filter criteria
      // Update the recipeList in the state
      setState(() {
        // Replace the below example data with your actual recipe data
        recipeList = [
          {
            'id': '1',
            'name': 'Recipe 1',
            'image': 'https://fakeimg.pl/325x150'
          },
          {
            'id': '2',
            'name': 'Recipe 2',
            'image': 'https://fakeimg.pl/325x150'
          },
          // Add more recipes as needed
        ];
      });
    } catch (e) {
      // Handle any errors that might occur during the fetch
      debugPrint("Error fetching recipes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          const CookyAppBar(color: Color(0xffCB4036), currentScreen: 'client'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Welcome to Cooky',
                style: GoogleFonts.paytoneOne(fontSize: 20),
              ),
              Text(
                'This is your Recipe Collection',
                style:
                    GoogleFonts.lexend(fontSize: 14, color: Color(0xffCB4036)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FilledButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          ownRecipesSelected ? Color(0xffCB4036) : Colors.white,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          ownRecipesSelected = true;
                        });
                      },
                      child: Text(
                        'Own Recipes',
                        style: GoogleFonts.lexend(
                          color: ownRecipesSelected
                              ? Colors.white
                              : Colors.black45,
                        ),
                      ),
                    ),
                    // Add some space between buttons
                    FilledButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          ownRecipesSelected ? Colors.white : Color(0xffCB4036),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          ownRecipesSelected = false;
                        });
                      },
                      child: Text(
                        'Other\'s Recipes',
                        style: GoogleFonts.lexend(
                          color: ownRecipesSelected
                              ? Colors.black45
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipeList.length,
                itemBuilder: (context, index) {
                  var recipe = recipeList[index];

                  return Center(
                    child: Column(
                      children: [
                        RecipeCard(
                          name: widget.userId,
                          id: recipe['id'],
                          recipeName: recipe['name'],
                          image: recipe['image'],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          AddRecipeFAB(currentScreen: 'client', name: widget.userId),
    );
  }
}

class FilledButton extends StatelessWidget {
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Widget? child;

  const FilledButton({
    Key? key,
    this.style,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: child,
    );
  }
}
