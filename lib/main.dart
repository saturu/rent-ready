import 'package:flutter/material.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/service/app_service.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var list = <AccountResponse>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    list = await AppService().getAccount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (AccountResponse a in list)
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.network(
                                    '${a.image}',
                                    fit: BoxFit.cover,
                                  )),
                            )),
                        Expanded(
                            flex: 7,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${a.name}'),
                                    SizedBox(height: 8,),
                                    Text('${a.addressLine}',style: TextStyle(fontSize: 10),)
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
