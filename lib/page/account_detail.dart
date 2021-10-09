import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/view_model/account_detail_view_model.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final val = AccountDetailViewModel();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountDetailViewModel>.value(
        value: val,
        child: Consumer<AccountDetailViewModel>(
          builder: (_,model,__){
            return Scaffold(
              body: ListView(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(

                                hintText: 'Search',
                                prefixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){},)
                            ),
                          ),
                        ),
                      ),
                      FilterItem(),
                      IconButton(
                          constraints: BoxConstraints(),
                          padding:EdgeInsets.zero,onPressed: (){}, icon: Icon(Icons.grid_view)),
                      IconButton(
                          constraints: BoxConstraints(),
                          padding:EdgeInsets.zero,onPressed: (){}, icon: Icon(Icons.view_list)),
                      SizedBox(width: 8,),
                    ],
                  ),
                  for (AccountResponse a in model.allAccount)
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
          },
        ),
    );
  }
}
class FilterItem extends StatelessWidget {
  final GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return           Row(
      children: [
        PopupMenuButton(
            key: _menuKey,
            icon: Icon(Icons.filter_alt_sharp),
            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: Column(
                  children: [
                    Text('State or Province'),
                    Divider(),
                  ],
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("First"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Second"),
                value: 2,
              )
            ]
        ),
        InkWell(
            onTap: (){
              dynamic state = _menuKey.currentState;
              state.showButtonMenu();
            },
            child: Text('Filter')),
        SizedBox(width: 4,),
      ],
    );
  }
}
