// This is a basic Flutter widget test_driver.
//
// To perform an interaction with a widget in your test_driver, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/test.dart' as test;
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  test.group('Account Detail Page', () {
    FlutterDriver? driver;
    final listFirstItem = find.byValueKey('listitem0');
    final filterButton = find.byValueKey('filterButton');
    final searchButton = find.byValueKey('searchButton');
    final filterFirstItem = find.byValueKey('state0');
    final txtSearch = find.byValueKey('txtSearch');

    test.setUpAll(() async {
      driver = await FlutterDriver.connect(
          dartVmServiceUrl: 'http://127.0.0.1:9103');
    });
    test.tearDownAll(() async {
      driver!.close();
    });

    test.test('Item List Check', () async {
      await driver!.waitFor(listFirstItem);
      test.expect( await driver!.getText(listFirstItem), test.isNotEmpty);

    });
    test.test('Filter Check', () async {
      await driver!.tap(filterButton);
      String text = await driver!.getText(filterFirstItem);
      await driver!.tap(filterFirstItem);
      test.expect( await driver!.getText(listFirstItem), test.contains(text));
    });
    test.test('Search Check', () async{
      await driver!.tap(txtSearch);
      await driver!.enterText('Voe');
      await driver!.tap(searchButton);
      test.expect( await driver!.getText(listFirstItem), test.contains('Voe'));


    });
  });
}
