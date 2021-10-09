import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/service/app_service.dart';

class AccountDetailViewModel extends ChangeNotifier{
  var isLoading = true;
  var apiService = AppService();
  var allAccount = <AccountResponse>[];

  AccountDetailViewModel(){
    init();
  }

  init() async{
    var token = await apiService.getToken();
    apiService.dio.options = BaseOptions(
      headers: {'Authorization':'Bearer ${token.accessToken}'}
    );
    allAccount = await apiService.getAccount();
    isLoading = false;
    print(allAccount.first.addressLine);
    notifyListeners();
  }


}