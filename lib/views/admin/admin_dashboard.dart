// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/utils/pocketbase_conn_test_utils.dart';

import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

import '../../widgets/add_recipe_fab.dart';

class AdminDashboard extends StatefulWidget {
  final name;
  final token;
  final id;
  const AdminDashboard({
    Key? key,
    required this.name,
    required this.token,
    required this.id,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  bool ownRecipesSelected = true;

  List<dynamic> recipeList = []; // Store the list of recipes

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    try {
      // Fetch all records from the 'recipe' collection and sort by the 'created' field in descending order
      final records = await PocketBaseTestUtils.pocketBaseTestInstance
          .collection('recipe')
          .getFullList(sort: '-created');

      setState(() {
        recipeList = records;
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
          const CookyAppBar(color: Color(0xffCB4036), currentScreen: 'admin'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${widget.name}',
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
                  return Center(
                    child: Column(
                      children: [
                        RecipeCard(
                            auth_id: widget.id,
                            name: widget.name,
                            token: widget.token,
                            id: recipeList[index]['id'],
                            recipeName: recipeList[index]['recipe_name'],
                            image: recipeList[index]['image']),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddRecipeFAB(
          currentScreen: 'admin',
          id: widget.id,
          name: widget.name,
          token: widget.token),
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
