import 'package:flutter/material.dart';
import 'package:favoritecake/core/extension/int_extension.dart';

class OperationItemWidget extends StatelessWidget {

  final Widget _icon;
  final String _title;
  final Color titleColor;

  OperationItemWidget(this._icon, this._title, {this.titleColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px),
          Text(_title, style: TextStyle(color: this.titleColor))
        ],
      ),
    );
  }
}
