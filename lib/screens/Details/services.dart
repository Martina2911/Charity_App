import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase1/screens/Details/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../model/itemModel.dart';

class DetailServices {

  final _auth=FirebaseAuth.instance;
  final _store=FirebaseFirestore.instance;
  final _realDb=FirebaseDatabase.instance;
  final _storage=FirebaseStorage.instance;
  List <ItemModel> list =<ItemModel>[].obs;
  //DetailController con=Get.put(DetailController());

  ///add to fire store
  addToFireStore({ required ItemModel model,required index})async{
    try{
      await _store.collection(_auth.currentUser!.uid).
      doc("product$index").
      set(model.toJson());
    }catch(e){
      print(e);
    }
  }

  getAllData() async {
    final _store=FirebaseFirestore.instance;
    final data = await _store.collection(_auth.currentUser!.uid).
    get();
    print("List: ${data.docs.length}");
    return data.docs.map((e
        ) {
      return ItemModel.fromJson(e);
    }).toList();
  }

  ///add to real time

  uploadImageToStorage(
      {required String imagePath, required String imageName}) async {
    //assets/images/logo.png
    String empty="";
    final ref = _storage.ref().child('DonatedImage/$imageName'); //create place for your image
    final uploadedImage = await ref.putFile(File(imagePath)); //set your image to it's place
    final imageUrl = (await (await uploadedImage).ref.getDownloadURL()).toString();
   if(imageUrl!=null){
    return imageUrl;
    }
   else return empty;
  }


   Future<void> addToRealTime({required ItemModel model, required int index}) async {
     try{
    await _realDb.reference()
        .child(_auth.currentUser!.uid)
        .child("product$index")
        .set(model.toJson());
     }catch(e){
       print(e);
     }
  }

  Future<void> deleteData({required index}) async {
    await _store.collection(_auth.currentUser!.uid).
    doc("product$index").delete();
    print('deleted successfully!');
  //  con.index=index;
    final data=await getAllData();
    print(data);
    list.assignAll(data);
  }

  getAllTicketReal(Function(List<ItemModel>) callback) {
    final realTimeDb = FirebaseDatabase.instance;
    final dbRef = realTimeDb.reference().child(_auth.currentUser!.uid);
    dbRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        final List<ItemModel> users = [];
        data.forEach((key, value) {
          users.add(ItemModel.fromJson(value));
        });
        callback(users);
      }
    });
  }
// Future<List<ItemModel>> getDataFromRealtimeDB() async {
//   final DatabaseReference _realtimeDB = FirebaseDatabase.instance.reference();
//   try {
//     DataSnapshot dataSnapshot = (await _realtimeDB
//         .child(_auth.currentUser!.uid) // Replace with the user's ID
//         .once()) as DataSnapshot;
//
//     Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;
//
//     if (data != null) {
//       List<ItemModel> items = data.entries.map((entry) {
//         Map<dynamic, dynamic> itemData = entry.value;
//         return ItemModel.fromJson(itemData as QueryDocumentSnapshot<Map<String, dynamic>>);
//       }).toList();
//
//       return items;
//     } else {
//       return [];
//     }
//   } catch (e) {
//     print('Error getting data from Realtime Database: $e');
//     return [];
//   }
// }

// final databaseReference = FirebaseDatabase.instance.reference();
// Future<void> getDataFromRealtimeDatabase() async {
//   try {
//     await databaseReference.child(_auth.currentUser!.uid).once().then((DatabaseEvent databaseEvent)  {
//       Object? data = databaseEvent.snapshot.value;
//       return data;
//     });
//   } catch (e) {
//     print('Error: $e');
//   }
// }
//


// getAllTicketReal() async {
//   final data = await _realDb.reference().child(_auth.currentUser!.uid).get();
//   return data;
// }



// getAllTicketReal() async {
//   //final data=
//   await _realDb.reference().child(_auth.currentUser!.uid).get();
// }
//
//
//  getAllDataRealTime(void Function(List<ItemModel> data) callback) {
//   final dbRef = _realDb.reference().child(_auth.currentUser!.uid);
//   return dbRef.onValue.listen((event) {
//     final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
//     if (data != null) {
//       final List<ItemModel> users = [];
//       data.forEach((key, value) {
//         users.add(ItemModel.fromJson(value));
//       });
//       callback(users);
//     }
//   });
// }
//
// getAllTicketReal(Function (List<ItemModel> data) callback) {
//   final user = FirebaseAuth.instance.currentUser;
//   final userId = user?.uid;
//   final dbRef = _realDb.reference().child(_auth.currentUser!.uid);
//   dbRef.onValue.listen((event) {
//     final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
//     if (data != null) {
//       final List<ItemModel> users = [];
//       data.forEach((key, value) {
//         users.add(ItemModel.fromJson(value));
//       });
//       callback(users);
//     }
//   });
// }

// ref ->child ->child ->child
//   addToRealTime({ required ItemModel model,required index})async{
//     await _realDb.reference()
//         .child(_auth.currentUser!.uid)
//         .child("product$index")
//         .set(model.toJson());
//
//   }

// getAllTicketReal(Function(List<ItemModel>) callback) {
//   final realTimeDb = FirebaseDatabase.instance;
//   final dbRef = realTimeDb.reference().child(_auth.currentUser!.uid);
//   dbRef.onValue.listen((event) {
//     final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
//     if (data != null) {
//       final List<ItemModel> users = [];
//       data.forEach((key, value) {
//         users.add(ItemModel.fromJson(value));
//       });
//       callback(users);
//     }
//   });
// }

// addToRealTime({required ItemModel model, required index}) async {
//   await _realDb.reference()
//       .child(_auth.currentUser!.uid)
//       .child("product$index")
//       .set(model.toJson());
// }

}
