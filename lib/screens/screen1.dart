
import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/DB/read.dart';
import 'package:flutter_localdatabase/models/cookmodels.dart';
import 'package:flutter_localdatabase/widgets/List.dart';
import 'package:flutter_localdatabase/widgets/appbar.dart';
import 'package:flutter_localdatabase/widgets/gridview.dart';

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  int listLength = 20;
  late List<bool> _selected;
  bool _selectAll = false;
  bool _isGridMode = false;
  List<cokkies> cooks= [cokkies("name", "description", ["ingredients"], "origin", ["popularregions"], "imageurl")];
  

  @override
  void initState() {
    super.initState();
    initializeSelection();
    loadData().then((value) {
   
      listLength = value.length;
      setState(() {
        cooks.clear();
        listLength = value.length;
        _selected = List<bool>.generate(listLength, (_) => false);
        for ( Map<String, dynamic> data in value) {
          cooks.add(cokkies.fromMap(data));
        }
      });
     
      
    });

  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: createbar (
          isSelectionMode,
          initializeSelection,
          _isGridMode,
          _selectAll,
          _selected,
          listLength,
        (){setState(() {
                      isSelectionMode = false;
                    });
                    initializeSelection();}, 
                    () {
                  setState(() {
                    _isGridMode = false;
                  });
                }
                
                , () {
                  setState(() {
                    _isGridMode = true;
                  });
                }, () {
                    _selectAll = !_selectAll;
                    setState(() {
                      _selected =
                          List<bool>.generate(listLength, (_) => _selectAll);
                    });
                  }      ),
        body: _isGridMode
            ? GridBuilder(
                isSelectionMode: isSelectionMode,
                selectedList: _selected,
                onSelectionChange: (bool x) {
                  setState(() {
                    isSelectionMode = x;
                  });
                },
              )
            : ListBuilder(
                isSelectionMode: isSelectionMode,
                selectedList: _selected,
                onSelectionChange: (bool x) {
                  setState(() {
                    isSelectionMode = x;
                  });
                },data:cooks
                
              ));
  }
}



 

