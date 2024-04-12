import 'dart:convert';

import 'package:bloc_http_post/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
abstract class TransactionRepository{
  Future<TransactionModel> fetchDetails();
}

class TransactionRepo extends TransactionRepository{
  @override
  Future<TransactionModel> fetchDetails()  async{
    final String url = "http://192.168.0.17/api/Values";
    final response = await http.post(Uri.parse(url));
    if(response.statusCode == 200){
      print(response.body);
      return TransactionModel.fromJson(jsonDecode(response.body));

    }else {
      debugPrint("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }

}