
import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/DB/read.dart';
import 'package:flutter_localdatabase/models/cookmodels.dart';
import 'package:flutter_localdatabase/widgets/List.dart';
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

        // Update listLength based on the loaded data
        listLength = value.length;

        // Generate selected list and add cokkies objects to the cooks list
        _selected = List<bool>.generate(listLength, (_) => false);
        for ( Map<String, dynamic> data in value) {
          cooks.add(cokkies.fromMap(data));
        }
        print(cooks);
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
        appBar: AppBar(
          title: const Text(
            'ListTile selection',
          ),
          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      isSelectionMode = false;
                    });
                    initializeSelection();
                  },
                )
              : const SizedBox(),
          actions: <Widget>[
            if (_isGridMode)
              IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  setState(() {
                    _isGridMode = false;
                  });
                },
              )
            else
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  setState(() {
                    _isGridMode = true;
                  });
                },
              ),
            if (isSelectionMode)
              TextButton(
                  child: !_selectAll
                      ? const Text(
                          'select all',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'unselect all',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    _selectAll = !_selectAll;
                    setState(() {
                      _selected =
                          List<bool>.generate(listLength, (_) => _selectAll);
                    });
                  }),
          ],
        ),
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
