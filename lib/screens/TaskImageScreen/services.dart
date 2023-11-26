import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../model/itemModel.dart';

class ImageServices {

  final _auth=FirebaseAuth.instance;
  final _store=FirebaseFirestore.instance;
  final _realDb=FirebaseDatabase.instance;
  final _storage=FirebaseStorage.instance;

  ///add to fire store
  addToFireStore({ required ItemModel model})async{
    try{
      await _store.collection('ads').
      doc(_auth.currentUser!.uid).
      set(model.toJson());

    }catch(e){
      print(e);
    }
  }

  ///add to real time
// ref ->child ->child ->child
  addToRealTime({ required ItemModel model})async{
    await _realDb.reference()
        .child('ads')
        .child(_auth.currentUser!.uid)
        .set(model.toJson());
  }

  uploadImageToStorage(
    {required String imagePath}) async {
    final ref = _storage.ref().child('TestImage'); //create place for your image
    final uploadedImage = await ref.putFile(File(imagePath)); //set your image to it's place
    final imageUrl = (await (await uploadedImage).ref.getDownloadURL()).toString(); // generate image url
    return imageUrl;
  }


  getAllData() async {
    final _store=FirebaseFirestore.instance;
    final data = await _store.collection("ads").
    get();
    print("List: ${data.docs.length}");
    return data.docs.map((e //each item
        ) {
      return ItemModel.fromJson(e);
    }).toList();
  }

  getAllTicketReal(Function(List<ItemModel>) callback) {
    final realTimeDb=FirebaseDatabase.instance;
    final dbRef = realTimeDb.reference().child('ads');
    dbRef.onValue.listen((event) {
      final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        final List<ItemModel> users = [];
        data.forEach((key, value) {
          users.add(ItemModel.fromJson(value));
        });
        callback(users);
      }
    });
  }
}