import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert' : Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'input'         : Icons.input,
  'modal'         : Icons.ad_units_outlined,
  'pasar'         : Icons.account_tree,
  'form'         : Icons.accessible_forward_rounded,
  'http'         : Icons.https_sharp,

};
Icon getIcono( String nombreIcono ) {
  return Icon(
      _icons[nombreIcono],
      color: Colors.blue
  );
}