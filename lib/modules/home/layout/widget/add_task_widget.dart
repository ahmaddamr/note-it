import 'package:cherry_toast/cherry_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/modules/home/layout/widget/custom_elevated_button.dart';
// import 'package:cherry_toast/cherry_toast.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, Provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'add'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: Provider.titleController,
                  decoration:
                      const InputDecoration(hintText: 'enter Your Task'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: Provider.descController,
                  decoration: const InputDecoration(hintText: 'Descreption'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'date'.tr(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: Provider.datePicker,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365),
                  ),
                ).then(
                  (value) {
                    Provider.changeDatePicker(
                      value ?? DateTime.now(),
                    );
                  },
                );
              },
              child: Center(
                child: Text(
                  Provider.datePicker.toString().substring(0, 10),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'time'.tr(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 22,
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                showTimePicker(context: context, initialTime: Provider.time)
                    .then((value) 
                    {
                      Provider.setTime(value!);
                    });
              },
              child: Center(
                child: Text(
                  '${Provider.time.hour} : ${Provider.time.minute}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 70,
            // ),
            Center(
              child: SizedBox(
                width: 350,
                child: CustomElvatedButton(
                  text: 'submit'.tr(),
                  backgroundColor: Colors.blue,
                  borderSideColor: Colors.transparent,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 22,
                      ),
                  onPressed: () async {
                    // TaskModel taskModel = TaskModel(
                    //     title: titleController.text,
                    //     desc: descController.text,
                    //     time: Provider.date.millisecondsSinceEpoch,
                    //     isDone: false);
                    // await FirebaseFunctions.addTask(taskModel);
                    Provider.addTask();
                    CherryToast.success(
                      title: const Text(
                        "Task Added Successfuly",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ).show(context);
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
