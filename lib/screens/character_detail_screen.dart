import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radiusImageContainer = Radius.circular(25);
    final navigatorBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: radiusImageContainer,
                      bottomRight: radiusImageContainer),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 82, 82, 82),
                      blurRadius: 35,
                      spreadRadius: 4,
                    ),
                  ],
                  color: Color.fromARGB(255, 5, 17, 24),
                ),
                padding: EdgeInsets.only(
                    top: navigatorBarHeight + 30,
                    bottom: 30,
                    left: 20,
                    right: 20),
                width: double.infinity,
                child: const CustomCircleAvatar(),
              ),
              Positioned(
                top: navigatorBarHeight + 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ]),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "IronMan - (Tony Stark)",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.secularOne(
                      fontSize: 40,
                      color: const Color.fromARGB(255, 37, 37, 37),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel arcu eget nunc malesuada malesuada. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In accumsan rhoncus augue, sit amet pellentesque mi lacinia eu. Sed lacinia metus et dui maximus cursus. Praesent at cursus nisl, non convallis ante. Duis et luctus enim. Donec in velit turpis. Nullam eu maximus elit. Donec eros nulla, tempor eget iaculis sit amet, mattis sit amet sapien. Mauris vel ligula eu quam egestas cursus. Fusce vitae nibh vitae ex tempus ultrices sed ac nisi. Morbi vel enim mi. Quisque ac consequat dolor, non sollicitudin elit. Donec ultricies aliquam viverra. Praesent aliquam porta metus, eget mollis nisi volutpat quis.
                    ''',
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = 150.0;
    return const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 194, 2, 2),
      radius: radius,
      child: CircleAvatar(
        radius: radius - 10,
        backgroundImage: NetworkImage(
          "https://terrigen-cdn-dev.marvel.com/content/prod/1x/ayo-aneka1_copy.jpg",
        ),
      ),
    );
  }
}
