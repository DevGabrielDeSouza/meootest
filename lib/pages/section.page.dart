import 'package:flutter/material.dart';

import '../main.dart';

class SectionPage extends StatelessWidget {
  SectionPage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();
  final bool closeTopContainer = false;
  final double topContainer = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>{
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homePage))
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const Text("Menu",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      key: Key('menu-button')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}