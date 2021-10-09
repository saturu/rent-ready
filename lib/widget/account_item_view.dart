import 'package:flutter/material.dart';
import 'package:rent_ready_assessment/model/account_response.dart';

class AccountItemView extends StatelessWidget {
  final AccountResponse account;
  final bool isGridView;
  final ValueKey valueKey;

  const AccountItemView(
      {Key? key, required this.account, required this.valueKey,this.isGridView = false})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Card(
          child: Container(
            key: valueKey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: isGridView ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:itemContent(isGridView: true),
            ) : Row(
              children: itemContent(),
            ),
          ),
        ));
  }
  List<Widget> itemContent({bool isGridView = false}) => [
    Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                '${account.image}',
                fit: BoxFit.cover,
              )),
        )),
    Expanded(
        flex: isGridView ? 0 : 7,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${account.name}'),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${account.addressLine}',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        )),
  ];
}
