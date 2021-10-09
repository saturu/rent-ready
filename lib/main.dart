import 'package:flutter/material.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/page/account_detail.dart';
import 'package:rent_ready_assessment/service/app_service.dart';
import 'package:rent_ready_assessment/view_model/account_detail_view_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccountDetail()
  ));
}