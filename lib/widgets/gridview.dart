import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/models/cookmodels.dart';

class GridBuilder extends StatefulWidget {
  const GridBuilder(
      {super.key,
      required this.selectedList,
      required this.isSelectionMode,
      required this.onSelectionChange,
      required this.data});

  final bool isSelectionMode;
  final ValueChanged<bool>? onSelectionChange;
  final List<bool> selectedList;
  final List<cokkies> data;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    } else {
      Navigator.pushNamed(context, '/mealdetails',
          arguments: widget.data[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.data.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                
                
                  onTap: () => _toggle(index),
                  onLongPress: () {
                    if (!widget.isSelectionMode) {
                      setState(() {
                        widget.selectedList[index] = true;
                      });
                      widget.onSelectionChange!(true);
                    }
                  },
                  child: GridTile(
                      child: Container(
                    child: widget.isSelectionMode
                        ? Checkbox(
                            onChanged: (bool? x) => _toggle(index),
                            value: widget.selectedList[index])
                        : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(widget.data[index].getimageurl,
                                scale: 0.1,fit: BoxFit.cover,
                                height: MediaQuery.sizeOf(context).width*0.5-55,)),
                                 Text(widget.data[index].getname)
                    
                              
                            ],
                          ),
                        ),
                  )),
                ),   
                  
              ],
            ),
          );
        });
  }
}
