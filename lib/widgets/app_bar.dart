import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Icon(
          Icons.search_outlined,
          color: Color.fromARGB(255, 17, 20, 26),
        ),
        SizedBox(width: 15),
      ],
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      leading: const Icon(
        Icons.bookmark,
        color: Color.fromARGB(255, 17, 20, 26),
      ),
      title: Text(
        title,
        style: GoogleFonts.heebo(
          color: const Color.fromARGB(255, 17, 20, 26),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
