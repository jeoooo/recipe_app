// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/utils/pocketbase_conn.dart';
import 'package:recipe_app/views/admin/admin_login.dart';
import 'package:recipe_app/views/client/login.dart';

class CookyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final String? currentScreen; // Make the parameter optional

  const CookyAppBar({
    Key? key,
    required this.color,
    this.currentScreen, // Provide a default value or make it nullable
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 16, bottom: 14),
        child: SvgPicture.asset(
          'assets/app_logo.svg',
          width: 200,
          height: 30,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        PopupMenuButton<int>(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          icon: Icon(Icons.more_vert),
          onSelected: (value) {
            // Handle menu item selection
            // if (value == 1) {
            //   // Dark mode option
            //   // Implement your dark mode logic here
            // }
            if (value == 1) {
              // Logout option
              // Implement your logout logic here
              if (currentScreen == 'client') {
                // Navigate to login screen
                PocketBaseUtils.pocketBaseInstance.authStore.clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              } else if (currentScreen == 'admin') {
                // Navigate to admin login screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdminLogin()));
              }
            }
          },
          itemBuilder: (context) => [
            // PopupMenuItem<int>(
            //   value: 1,
            //   child: Row(
            //     children: [
            //       Icon(Icons.dark_mode, color: Colors.black),
            //       SizedBox(width: 8),
            //       Text('Dark Mode',
            //           style: GoogleFonts.lexend(fontWeight: FontWeight.w400)),
            //     ],
            //   ),
            // ),
            PopupMenuItem<int>(
              onTap: () {
                // Handle tap if needed
              },
              value: 2,
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 8),
                  Text('Log Out',
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
