import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final GlobalKey _menuKey = GlobalKey();
  final List<String> stateOrProvince;
  final Function(dynamic) onSelected;

  FilterItem({Key? key, required this.stateOrProvince,required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton(
            key: _menuKey,
            icon: Icon(Icons.filter_alt_sharp),
            onSelected: onSelected,
            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: Column(
                  children: [
                    Text('State or Province'),
                    Divider(),
                  ],
                ),
              ),
              for (final item in stateOrProvince)
                PopupMenuItem(
                  key: Key('state${stateOrProvince.indexOf(item)}'),
                  child: Text(item),
                  value: item,
                ),
              PopupMenuItem(
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('State Code'),
                    Divider(),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Text('0'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('1'),
                value: 1,
              ),
            ]),
        InkWell(
            onTap: () {
              dynamic state = _menuKey.currentState;
              state.showButtonMenu();
            },
            child: Text('Filter')),
        SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
