import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddItemServices{
  final store =FirebaseFirestore.instance;
  final auth =FirebaseAuth.instance;

//collection -1000doc - (Collection -field)

  addToFireStore()async{ //set ,get ,delete ,update
    await store.collection('products')//0C6QQUixMlQch2Pd3DqmXeFi9iL2
        .doc(auth.currentUser!.uid)
    // .set({'data':'zeina'});
        .collection('listOfItems')
        .doc('2023-10-1').set({
      'data':'zeina',
      'data2':'22',
      'data3':'33',
      'data4':'44',
      'data5':'55',
    });

  }



}