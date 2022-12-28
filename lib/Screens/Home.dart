

import 'package:finote_birhan_mobile/blocs/recommendationBloc/recommendation_event.dart';
import 'package:finote_birhan_mobile/blocs/zemarianBloc/zemarian_bloc.dart';
import 'package:finote_birhan_mobile/repository/mezmurs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../blocs/WerebCategoryBloc/wereb_category_bloc.dart';
import '../blocs/WerebCategoryBloc/wereb_category_event.dart';
import '../blocs/mezmursCategoyBloc/mezmurs_category_bloc.dart';
import '../blocs/mezmursCategoyBloc/mezmurs_category_event.dart';
import '../blocs/recommendationBloc/recommendation_bloc.dart';
import '../blocs/zemarianBloc/zemarian_event.dart';
import '../repository/services/mezmurs_service.dart';
import 'Pages/Home/home_page.dart';
import 'Pages/mezmur_page.dart';
import 'Pages/search_page.dart';
import 'Pages/wereb_page.dart';
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
            items:  [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label:'መግቢያ'
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books),
                  activeIcon: Icon(Icons.menu_book_sharp),

                  label:'መዝሙር'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        left: 33.0,
                        top:8
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Tsenanesel.svg',
                      height: 32,
                      color: Colors.grey,
                      ),
                  ),
                  activeIcon:
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: SvgPicture.asset(
                        'assets/icons/mekomiya.svg',
                        height: 28,

                  ),
                    ),
                  label:'ወረብ'
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  activeIcon: Icon(Icons.search),
                  label:'ፈልግ')
            ],

          ),

        );

  }
}
