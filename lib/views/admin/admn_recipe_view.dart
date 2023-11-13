// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';
import 'package:recipe_app/views/admin/admin_dashboard.dart';
import 'package:recipe_app/widgets/CustomAlertDialog.dart';
import 'package:recipe_app/widgets/cooky_app_bar.dart';

class AdminRecipeView extends StatelessWidget {
  final name;
  final token;
  final auth_id;
  final id;
  const AdminRecipeView(
      {super.key,
      required this.id,
      required this.auth_id,
      required this.name,
      required this.token});

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
                      ElevatedButton.icon(
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
                    // Show a confirmation dialog
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

                    // Proceed with the delete operation if the user confirmed
                    if (confirmDelete ?? false) {
                      PocketBaseUtils.pocketBaseInstance
                          .collection('recipe')
                          .delete(id);

                      // Optionally show another dialog or perform other actions after deletion
                      // ignore: use_build_context_synchronously
                      CustomAlertDialog.show(
                        context: context,
                        title: 'Deletion Successful',
                        message: 'The item has been deleted.',
                      );

                      // Optionally navigate to another screen or perform other actions
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminDashboard(
                                    id: auth_id,
                                    name: name,
                                    token: token,
                                  )));
                    } else {
                      // User canceled the delete operation, do nothing or perform additional actions
                    }
                  },
                  label: Text('Delete'),
                )
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
