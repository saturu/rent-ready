import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/service/app_service.dart';

class AccountDetailViewModel extends ChangeNotifier {
  var isLoading = true;
  var apiService = AppService();
  var allAccount = <AccountResponse>[];
  var allStateOrProvince = <String>[];
  var isGridView = false;

  AccountDetailViewModel() {
    init();
  }

  init() async {
    var token = await apiService.getToken();
    apiService.dio.options = BaseOptions(headers: {
      'Authorization': 'Bearer ${token.accessToken}',
      'Content-Type': 'application/json',
      'charset': 'utf-8'
    });
    allAccount = await apiService.getAccount();
    allStateOrProvince =
        allAccount.map((e) => e.stateOrProvince!).toSet().toList();
    isLoading = false;
    print(allAccount.first.addressLine);
    notifyListeners();
  }

  //I didn't made local filter.
  // Because  data may have changed or new item included
  Future<void> filterChange(var selectedItem) async {
    isLoading = true;
    notifyListeners();
    var query = selectedItem is String
        ? '?\$filter=address1_stateorprovince eq \'$selectedItem\''
        : '?\$filter=statecode eq $selectedItem';
    allAccount = await apiService.getAccount(query: query);
    isLoading = false;
    notifyListeners();
  }

  void changeViewType({bool isGridView = false}) {
    this.isGridView = isGridView;
    notifyListeners();
  }
  //?$filter=contains(name,'Voegel') or contains(accountnumber,'Maltaz')
  Future<void> searchAccount(String searchQuery) async{
    isLoading = true;
    notifyListeners();
    var query = '?\$filter=contains(name,\'$searchQuery\') or contains(accountnumber,\'$searchQuery\')';
    allAccount = await apiService.getAccount(query: query);
    isLoading = false;
    notifyListeners();
  }


}
