import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_reminder_app/extensions/screen_handler.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/views/add_medication_page.dart';
import 'package:medicine_reminder_app/views/home_page.dart';
import 'package:medicine_reminder_app/views/medicine_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const MedicineView(),
    // Add other pages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: green,
        backgroundColor: pureWhite,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: green,
            ),
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/drugs.svg',
              color: green,
            ),
            icon: SvgPicture.asset('assets/icons/drugs.svg'),
            label: 'أدويتي',
          ),
          // Add a blank item to position in the center
          const BottomNavigationBarItem(
            icon: SizedBox.shrink(), // No icon
            label: '', // No label
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/ask.svg',
              color: green,
            ),
            icon: SvgPicture.asset('assets/icons/ask.svg'),
            label: 'اسأل ساعد',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/med.svg',
              color: green,
            ),
            icon: SvgPicture.asset('assets/icons/med.svg'),
            label: 'مسح دواء',
          ),
        ],
      ),
     floatingActionButton: Align(
        alignment: const Alignment(0.0, 0.95),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: green,
                spreadRadius: 1,
                blurRadius: 30,
                offset: Offset(0, 4), 
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            onPressed: () {
              context.push(view: AddMedicationPage(), isPush: true);
            },
            backgroundColor: green, 
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
