import 'package:finote_birhan_mobile/Pages/home_page.dart';
import 'package:finote_birhan_mobile/Pages/mezmur_page.dart';
import 'package:finote_birhan_mobile/Pages/search_page.dart';
import 'package:finote_birhan_mobile/Pages/wereb_page.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const MezmurPage(),
    const WerebPage(),
    const SearchPage(),

  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar:BottomNavigationBar(

        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        onTap: (index)=>{
          setState((){
            _currentIndex = index;
          })

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label:'መግቢያ'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              activeIcon: Icon(Icons.menu_book_sharp),

              label:'መዝሙር'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'ወረብ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label:'ፈልግ')
        ],

      )

    );
  }
}
