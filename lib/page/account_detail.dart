import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ready_assessment/model/account_response.dart';
import 'package:rent_ready_assessment/view_model/account_detail_view_model.dart';
import 'package:rent_ready_assessment/widget/account_item_view.dart';
import 'package:rent_ready_assessment/widget/filter_item.dart';
import 'package:skeletons/skeletons.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final val = AccountDetailViewModel();
  final txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountDetailViewModel>.value(
      value: val,
      child: Consumer<AccountDetailViewModel>(
        builder: (_, model, __) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            key: Key('txtSearch'),
                            controller: txtSearch,
                            decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.search,key: Key('searchButton'),),
                                  onPressed: () =>
                                      model.searchAccount(txtSearch.text),
                                )),
                          ),
                        ),
                      ),
                      FilterItem(
                        key: Key('filterButton'),
                        onSelected: model.filterChange,
                        stateOrProvince: model.allStateOrProvince,
                      ),
                      IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () =>
                              model.changeViewType(isGridView: true),
                          icon: Icon(Icons.grid_view)),
                      IconButton(
                          constraints: BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () => model.changeViewType(),
                          icon: Icon(Icons.view_list)),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Skeleton(
                        isLoading: model.isLoading,
                        skeleton: SkeletonListView(),
                        child: model.isGridView
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (c, i) {
                                  var account = model.allAccount[i];
                                  return AccountItemView(
                                    valueKey: ValueKey('listitem$i'),
                                    account: account,
                                    isGridView: true,
                                  );
                                },
                                itemCount: model.allAccount.length)
                            : ListView.builder(
                            itemBuilder: (c, i) {
                              var account = model.allAccount[i];
                              return AccountItemView(
                                  valueKey: ValueKey('listitem$i'),
                                  account: account);
                            },
                            itemCount: model.allAccount.length,
                              )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
