import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../helper/cache_helper.dart';
import '../../model/itemModel.dart';
import '../Details/services.dart';

class AllDetailController extends GetxController{
  final loading=false.obs;
  final loading2=false.obs;
  DetailServices services=DetailServices();
  List <ItemModel> list =<ItemModel>[].obs;

  @override
    onReady() {
    final token =  CacheHelper.getData(key: 'token');
    if (token != null) {
    getAllData();
    }
  super.onReady();
  }

  @override
  onInit(){
    super.onInit();
    final token = CacheHelper.getData(key: 'token');
    if (token != null) {
      getAllData();
    }
  }

  getAllData()async{
    loading.value=true;
    try{
      final data=await services.getAllData();
      print(data);
      list.assignAll(data);
      loading.value=false;
    }catch(e){
      print(e);
    }

  }



  // Future<void> retrieveDataFromRealtimeDB() async {
  //   try {
  //     loading.value = true;
  //     final data = await services.getDataFromRealtimeDB();
  //     list.assignAll(data);
  //   } catch (e) {
  //     print('Error retrieving data from Realtime Database: $e');
  //   } finally {
  //     loading.value = false;
  //   }
  // }

//real time database
//   Future<DataSnapshot?> getAllTicket() async {
//     DataSnapshot? data = await services.getDataFromRealtimeDatabase();
//     return data;
//   }

  // getAllTicket() async {
  //
  //   loading.value = true;
  //   await services.getAllTicketReal((users) {
  //     list.assignAll(users);
  //     loading.value = false;
  //   });
  // }

  // getAllDataRealTime(void Function(List<ItemModel> data) callback) {
  //   return services.getAllDataRealTime(callback);
  // }


  // getAllTicket() async {
  //   loading2.value = true;
  //   try{
  //   await services.getAllTicketReal((users)
  //   {
  //     list.assignAll(users);
  //     loading2.value = false;
  //
  //   });
  //   }catch(e){
  //     print(e);
  // }
  // }
}