// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/shared/constants.dart';
import 'package:notesapp/controller/controller.dart';
import 'package:notesapp/shared/setting.dart';
import 'package:notesapp/view/screens/complettaskes.dart';
import 'package:notesapp/view/screens/edit_screen.dart';
import 'package:notesapp/view/screens/report.dart';
import 'package:notesapp/view/screens/viewnote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SQLController control = Get.find();
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final CounterController _controller = Get.put(CounterController());

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _controller.changeThemeMode();
            },
            icon: Icon(_controller.iconTheme()),
          )
        ],
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Viewdata(),
         const EditScreen(),
         const CompleteScreen(),
          ReportPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_rounded),
              label: 'Done',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report_gmailerrorred),
              label: 'Report',
            ),
            
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
