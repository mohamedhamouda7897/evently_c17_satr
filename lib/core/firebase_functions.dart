import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17_str/models/task_model.dart';
import 'package:evently_c17_str/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (user, _) {
            return user.toJson();
          },
        );
  }

  static Future<void> saveUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (taskModel, _) {
            return taskModel.toJson();
          },
        );
  }

  static Future<void> updateTask(TaskModel task) {
    var collection = getTasksCollection();
    return collection.doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getFavoriteTasks() {
    var collection = getTasksCollection();

    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isFavorite", isEqualTo: true)
        .snapshots();
  }

  static Stream<QuerySnapshot<TaskModel>> getStreamTasks({String? category}) {
    var collection = getTasksCollection();
    if (category != null) {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category", isEqualTo: category)
          .snapshots();
    }
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  // static Future<QuerySnapshot<TaskModel>> getTasks({String? category}) {
  //   var collection = getTasksCollection();
  //   if (category != null) {
  //     return collection.where("category", isEqualTo: category).get();
  //   }
  //   return collection.get();
  // }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }

  static Future<UserModel?> readUser() async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> data = await collection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return data.data();
  }

  static Future<void> createTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static login(
    String emailAddress,
    String password,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      onSuccess();
      // if (credential.user!.emailVerified) {
      //   onSuccess();
      // } else {
      //   onError("Email not verified");
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        onError("Wrong password provided for that user.");
      } else {
        onError(e.message);
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  static createUser(
    String emailAddress,
    String password,
    String name, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      UserModel user = UserModel(
        id: credential.user!.uid,
        name: name,
        email: emailAddress,
      );
      saveUser(user);
      await credential.user!.sendEmailVerification();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        onError("The account already exists for that email");
      } else {
        onError(e.message);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
