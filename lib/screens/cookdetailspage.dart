import 'package:flutter/material.dart';

import 'package:flutter_localdatabase/models/cookmodels.dart';

class cooksdetailspage extends StatefulWidget {
  const cooksdetailspage({super.key});

  @override
  _cooksdetailspage createState() => _cooksdetailspage();
}

class _cooksdetailspage extends State<cooksdetailspage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as cokkies;

    return Scaffold(
      appBar: AppBar(title: const Text("Details for meals")),
      body: SingleChildScrollView(

        child: Column(
          
         
          children: <Widget>[
            Container(
              child: SizedBox(height: 10),
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                minRadius: 100,
                backgroundImage:  NetworkImage(args.getimageurl),
            

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    args.getname,
                    style: TextStyle(fontSize: 30),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    "Description: ${args.getdescription}",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: const Text(
                    "Ingredients:",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                 for (int i = 0; i < args.ingredients.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Text("   ${i+1}-) ${args.ingredients[i]}",
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
              ],
            ),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: const Text(
                    "Origin country: ",style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child:  Text(
                    args.getorigin,style: TextStyle(fontSize: 20),
                  ),
                ),
         
         
                
              ],
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: const Text(
                    "Popular regions ",style: TextStyle(fontSize: 30),
                  ),
                ),
                  for (int i = 0; i < args.getpopularregions.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Text("   ${i+1}-) ${args.getpopularregions[i]}",
                          style: TextStyle(fontSize: 20)),
                    ),
                  )
               
         
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
