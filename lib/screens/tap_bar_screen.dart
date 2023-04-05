import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_universe/screens/screens.dart';
import 'package:marvel_universe/widgets/widgets.dart';

class TapBarScreen extends StatefulWidget {
  const TapBarScreen({Key? key}) : super(key: key);

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  final List<List<dynamic>> pages = [["Comics", ComicsScreen()], ["Characters", CharactersScreen()], ["Favourites", const FavouritesScreen()]];
  int _selectedItem = 0;
  List<dynamic> actualPage = ["Comics", ComicsScreen()];

  void _onItemTaped(int index) {
    _selectedItem = index;
    actualPage = pages.elementAt(_selectedItem);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: actualPage[0]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: actualPage[1],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(
        onItemTaped: _onItemTaped,
        currentIndex: _selectedItem,
      ),
    );
  }
}

class CustomBottomNavigatorBar extends StatelessWidget {
  final Function onItemTaped;
  final int currentIndex;
  const CustomBottomNavigatorBar(
      {Key? key, required this.onItemTaped, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.bebasNeue(
      letterSpacing: 1.5,
      height: 1.7,
    );
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 17, 20, 26),
      currentIndex: currentIndex,
      selectedFontSize: 21,
      unselectedFontSize: 16,
      iconSize: 26,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu_book_rounded,
          ),
          label: "Comics",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.face,
          ),
          label: "Characters",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.heart_broken,
          ),
          label: "My favourites",
        ),
      ],
      onTap: (x) => onItemTaped(x),
      selectedItemColor: const Color.fromARGB(255, 255, 198, 216),
      selectedLabelStyle: labelStyle,
      unselectedLabelStyle: labelStyle,
      unselectedItemColor: const Color.fromARGB(255, 226, 230, 252),
    );
  }
}
