
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/models/task_model.dart';
import 'package:todo_app2/modules/home/menu/widget/task_item.dart';
import 'package:todo_app2/services/firebase/firebase_functions.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  final String routeName = 'MenuScreen';



  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child:  Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 52),
                      child: Text('Hello , ${provider.user?.name??""}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 125.0),
                    child: EasyInfiniteDateTimeLine(
                      showTimelineHeader: false,
                      firstDate: FirebaseAuth.instance.currentUser!.metadata.creationTime!,
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      focusDate: provider.date,
                      locale: 'ar',
                      // initialDate: DateTime.now(),
                      onDateChange: provider.changeDate,
                      // headerProps: const EasyHeaderProps(showHeader: false),
                      activeColor: Colors.blue,
                      dayProps: EasyDayProps(
                        todayHighlightStyle: TodayHighlightStyle.withBackground,
                        todayHighlightColor:
                            const Color.fromARGB(255, 3, 63, 132),
                        inactiveDayStyle: DayStyle(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              
              StreamBuilder(
                stream: FirebaseFunctions.getTasks(provider.date),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('An Error Happened'));
                  } else {
                    List<TaskModel> tasks =
                        snapshot.data!.docs.map((e) => e.data()).toList();
                    return tasks.isEmpty ?  Text('The List iS Empty',style: Theme.of(context).textTheme.bodyLarge,) : Expanded(
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskItem(
                            taskModel: tasks[index],
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
