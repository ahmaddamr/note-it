// ignore_for_file: avoid_print
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/models/task_model.dart';
import 'package:todo_app2/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> mainTaskFunction() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('tasks').withConverter(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> mainUserFunction() {
    return FirebaseFirestore.instance.collection('users').withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel user) async {
    var ref = mainUserFunction();
    await ref.doc(user.id).set(user);
  }
  //! you link the model with firestore to fetch data
  static Future<UserModel?> getUser() async{
    var user = FirebaseAuth.instance.currentUser!.uid;
    var ref = mainUserFunction();
    var userDoc =await ref.doc(user).get();
    return userDoc.data();
  }

  static Future<void> addTask(TaskModel task) async {
    var ref = mainTaskFunction();
    var docRef = ref.doc();
    task.id = docRef.id;
    task.userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime time) {
    var userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    var ref = mainTaskFunction();
    return ref
        .where("time",
            isEqualTo: DateUtils.dateOnly(time).millisecondsSinceEpoch)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  static void deleteTask(String id) async {
    var ref = mainTaskFunction();
    await ref.doc(id).delete();
  }

  static Future<void> editTask(TaskModel task) async {
    var ref = mainTaskFunction();
    ref.doc(task.id).update(
          task.toJson(),
        );
  }

  static void changeDone(TaskModel task) async {
    var ref = mainTaskFunction();
    task.isDone = !task.isDone;
    await ref.doc(task.id).update(task.toJson());
  }

  static Future<UserCredential?> createUser(
      String email, var password, String name) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUser(UserModel(name: name, email: email, id: credential.user!.uid));
      print('email is: ${credential.user!.email}');
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<UserCredential?> signUser(String email, var password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(credential.user!.uid);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
