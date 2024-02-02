import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/models/cookmodels.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
    required this.data
    
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final ValueChanged<bool>? onSelectionChange;
  final List<cokkies> data;


  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
    else{
      Navigator.pushNamed(context, '/mealdetails',arguments: widget.data[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (_, int index) {
          return ListTile(
            leading:  CircleAvatar(backgroundColor:  Color.fromARGB(255, 178, 190, 201),backgroundImage: NetworkImage(widget.data[index].getimageurl)),
              onTap: () => _toggle(index),
              onLongPress: () {
                if (!widget.isSelectionMode) {
                  setState(() {
                    widget.selectedList[index] = true;
                  });
                  widget.onSelectionChange!(true);
                }
              },
              trailing: widget.isSelectionMode
                  ? Checkbox(
                      value: widget.selectedList[index],
                      onChanged: (bool? x) => _toggle(index),
                    )
                  : const SizedBox.shrink(),
              title: Text(widget.data[index].getname));
        
        });
  }
}