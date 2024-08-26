import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/modules/home/layout/widget/add_task_widget.dart';
import 'package:todo_app2/modules/home/menu/screen/menu_screen.dart';
import 'package:todo_app2/modules/home/settings/screen/settings_screen.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  final String routeName = 'LayoutScreen';
  List<Widget> tabs = [const MenuScreen(),  const SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      child: Selector<MainProvider, int>(
        selector: (p0, p1) => p1.currentIndex,
        builder: (context, currentIndex, child) {
          var provider = Provider.of<MainProvider>(context, listen: false);
          return Scaffold(
            extendBody: true,
            floatingActionButton: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: Colors.blue,
                onPressed: () {
                  showModalBottomSheet(
                    clipBehavior: Clip.hardEdge,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: provider,
                        child:  const AddTaskWidget());
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: SizedBox(
              height: 88,
              child: BottomAppBar(
                clipBehavior: Clip.antiAlias,
                shape: const CircularNotchedRectangle(),
                notchMargin: 12,
                // color: Colors.white,
                child: SizedBox(
                  width: 200,
                  height: 250,
                  child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: provider.changeTab,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                          label: 'Menu'),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          label: 'Settings'),
                    ],
                  ),
                ),
              ),
            ),
            body: tabs[currentIndex],
          );
        },
      ),
    );
  }

  
}
