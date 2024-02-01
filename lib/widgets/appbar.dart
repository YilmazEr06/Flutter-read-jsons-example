



import 'package:flutter/material.dart';

createbar(bool isSelectionMode, VoidCallback initializeSelection, bool isGridMode, bool selectAll, List<bool> selected, int listLength,VoidCallback selectionbuttonfunc,VoidCallback gridmodefunc1,VoidCallback gridmodefunc2,VoidCallback whenselectionmode) {
  return  AppBar(
          title: const Text(
            'ListTile selection',
          ),
          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => selectionbuttonfunc(),
                )
              : const SizedBox(),
          actions: <Widget>[
            if (isGridMode)
              IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed:() => gridmodefunc1() 
              )
            else
              IconButton(
                icon: const Icon(Icons.list),
                onPressed:() => gridmodefunc2  ()
              ),
            if (isSelectionMode)
              TextButton(
                  child: !selectAll
                      ? const Text(
                          'select all',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'unselect all',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () => whenselectionmode ()),
          ],
        );
}
