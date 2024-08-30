import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/theme/apptheme.dart';
import 'package:todo_app2/models/task_model.dart';
import 'package:todo_app2/models/user_model.dart';
import 'package:todo_app2/services/firebase/firebase_functions.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 0;
  var date = DateTime.now();
  var datePicker = DateTime.now();
  var time = TimeOfDay.now();
  ThemeData themeData = AppTheme().lightTheme;
  // bool Theme = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  UserModel? user;

  void changeTab(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeDate(DateTime dateTime) {
    date = dateTime;
    notifyListeners();
  }

  void changeDatePicker(DateTime dateTime) {
    datePicker = dateTime;
    notifyListeners();
  }

  void addTask() async {
    TaskModel taskModel = TaskModel(
        title: titleController.text,
        desc: descController.text,
        time: DateUtils.dateOnly(datePicker).millisecondsSinceEpoch,
        hour: '${time.hour} : ${time.minute}',
        isDone: false);
    titleController.clear();
    descController.clear();
    await FirebaseFunctions.addTask(taskModel);
    notifyListeners();
  }

  void deleteTask(String id) async {
    FirebaseFunctions.deleteTask(id);
    notifyListeners();
  }

  void editTask(TaskModel task) async {
    FirebaseFunctions.editTask(task);
    notifyListeners();
  }

  void changeDone(TaskModel task) {
    FirebaseFunctions.changeDone(task);
    notifyListeners();
  }

  void setTime(TimeOfDay value) {
    time = value;
    notifyListeners();
  }

  void getUser() async {
    user = await FirebaseFunctions.getUser();
    notifyListeners();
  }

  Future<void> changetheme(ThemeData themeData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', themeData == AppTheme().lightTheme);
    this.themeData = themeData;
    notifyListeners();
  }
}
