import 'package:cherry_toast/cherry_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/models/task_model.dart';
import 'package:todo_app2/modules/home/layout/widget/custom_elevated_button.dart';

class EditTasksScreen extends StatelessWidget {
  const EditTasksScreen({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Selector<MainProvider, DateTime>(
        selector: (p0, p1) => p1.datePicker,
        builder: (context, datePicker, child) {
          var provider = Provider.of<MainProvider>(context, listen: false);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'todo'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 52),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'edit'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            initialValue: taskModel.title,
                            onChanged: (value) {
                              taskModel.title = value;
                            },
                            // controller: MainProvider().titleController,
                            decoration: const InputDecoration(
                                hintText: 'enter Your Task'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: 350,
                          child: TextFormField(
                            initialValue: taskModel.desc,
                            onChanged: (value) {
                              taskModel.desc = value;
                            },
                            // controller: MainProvider().descController,
                            decoration:
                                const InputDecoration(hintText: 'Descreption'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'time'.tr(),
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 22,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate:
                                // DateTime.fromMillisecondsSinceEpoch(taskModel.time),
                                provider.datePicker,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          ).then(
                            (value) {
                              provider.changeDatePicker(
                                value ?? DateTime.now(),
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            provider.datePicker.toString().substring(0, 10),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 22,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: SizedBox(
                          width: 350,
                          child: CustomElvatedButton(
                            text: 'submit'.tr(),
                            backgroundColor: Colors.blue,
                            borderSideColor: Colors.transparent,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 22,
                                    ),
                            onPressed: () async {
                              // TaskModel taskModel = TaskModel(
                              //     title: titleController.text,
                              //     desc: descController.text,
                              //     time: Provider.date.millisecondsSinceEpoch,
                              //     isDone: false);
                              // await FirebaseFunctions.addTask(taskModel);
                              MainProvider().editTask(taskModel);
                              CherryToast.success(
                                title: const Text(
                                  "Task Edited Successfuly",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ).show(context);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
