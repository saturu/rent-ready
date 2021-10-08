import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rent_ready_assessment/constant/app_constant.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/model/token_response.dart';

class AppService {
  Dio dio = Dio();
  Future<TokenResponse> getToken() async {
    var request = await dio.post(
        'https://login.microsoftonline.com/${AppConstant.tenantId}/oauth2/v2.0/token',
        data: FormData.fromMap({
          'grant_type': 'client_credentials',
          'client_id': AppConstant.clientId,
          'client_secret': AppConstant.clientSecret,
          'scope': '${AppConstant.apiUrl}/.default'
        }));
    return TokenResponse.fromJson(request.data);
  }

  Future<List<AccountResponse>> getAccount() async {
    var token = await getToken();
    var request = await dio.get('${AppConstant.apiUrl}/api/data/v9.0/accounts',
        options: Options(headers: {'Authorization':'Bearer ${token.accessToken}'}));
    return (request.data['value'] as List).map((e) => AccountResponse.fromJson(e)).toList();
  }
}
