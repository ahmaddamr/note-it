import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app2/manager/provider/main_provider.dart';
import 'package:todo_app2/models/task_model.dart';
import 'package:todo_app2/modules/home/menu/screen/edit_tasks_screen.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Slidable(
          key: const ValueKey('test'),
          startActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () {
                provider.deleteTask(taskModel.id);
              },
            ),
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) async {
                  // FirebaseFunctions.deleteTask(taskModel.id);
                  provider.deleteTask(taskModel.id);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTasksScreen(
                        taskModel: taskModel,
                      ),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 445,
              height: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(17),
                    width: 4,
                    height: 65,
                    decoration: BoxDecoration(
                      color: taskModel.isDone ? Colors.green : Colors.blue,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          taskModel.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color:
                                  taskModel.isDone ? Colors.green : Colors.blue,
                              fontSize: 21),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            taskModel.desc,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.timelapse,
                            size: 19,
                          ),
                          Text(
                            provider.time.toString().substring(10 ,14),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      provider.changeDone(taskModel);
                      // provider.deleteTask(taskModel.id);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 120),
                      width: 70,
                      height: 34,
                      decoration: BoxDecoration(
                        color: taskModel.isDone ? Colors.green : Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
