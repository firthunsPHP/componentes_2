import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


// https://pub.dev/packages/modal_bottom_sheet/install
class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modales'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Modal-1'),
          onPressed: ()=> showCupertinoModalBottomSheet(
              expand: false,
              context: context,
              builder: (context) => Material(
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('Edit'),
                            leading: Icon(Icons.edit),
                            onTap: ()=> Navigator.of(context).pop(),
                          ),
                          ListTile(
                            title: Text('Copy'),
                            leading: Icon(Icons.content_copy),
                            onTap: ()=> Navigator.of(context).pop(),
                          ),
                          ListTile(
                            title: Text('Cut'),
                            leading: Icon(Icons.content_cut),
                            onTap: ()=> Navigator.of(context).pop(),
                          ),
                          ListTile(
                            title: Text('Move'),
                            leading: Icon(Icons.folder_open),
                            onTap: ()=> Navigator.of(context).pop(),
                          ),
                          ListTile(
                            title: Text('Delete'),
                            leading: Icon(Icons.delete),
                            onTap: ()=> Navigator.of(context).pop(),
                          ),
                        ],
                      )
                    ),
                  )
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ad_units_outlined),
        onPressed: ()=> showBarModalBottomSheet(
          context: context,
          builder: (context)=> Material(
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Modal page'),
              ),
                child: SafeArea(
                  child: ListView(
                    shrinkWrap: true,
                    controller: ModalScrollController.of(context),
                    physics: ClampingScrollPhysics(),
                    children: ListTile.divideTiles(
                        context: context,
                        tiles: List.generate(
                            100,
                                (index) => ListTile(
                                  title: Text('item $index'),
                                )
                        )
                    ).toList()
                  )
                )
              ),

            ),
          )
        ),

    );
  }
}
