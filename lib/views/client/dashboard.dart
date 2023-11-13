// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:recipe_app/widgets/cooky_app_bar.dart';
import 'package:recipe_app/widgets/recipe_card.dart';

import '../../widgets/add_recipe_fab.dart';

class Dashboard extends StatefulWidget {
  final name;
  final token;
  final id;
  const Dashboard({
    Key? key,
    required this.name,
    required this.token,
    required this.id,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool ownRecipesSelected = true;

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
              Center(
                child: Column(
                  children: [
                    RecipeCard(
                        id: 'id',
                        recipeName: 'test',
                        image: 'https://fakeimg.pl/325x150'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddRecipeFAB(
          currentScreen: 'client',
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
