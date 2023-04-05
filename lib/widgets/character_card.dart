import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final double? infoBoxHeight;
  final void Function()? onTap;

  const TitleAndImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.borderRadius = BorderRadius.zero,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.infoBoxHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(
            top: margin.top,
            right: margin.right,
            left: margin.left,
            bottom: margin.bottom),
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: borderRadius.topLeft,
            topRight: borderRadius.topRight,
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  imageUrl, //character.getThumbnail,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: borderRadius.bottomRight,
                    bottomLeft: borderRadius.bottomLeft),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.maxFinite,
                  height: infoBoxHeight,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 24, 24, 24),
                    border: Border(
                      top: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
