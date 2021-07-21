import 'package:flutter/material.dart';
import 'package:testpoc/pages/section.page.dart';
import '../data/constants.dart';

class StorePage2 extends StatefulWidget {
const StorePage2({Key? key}) : super(key: key);

@override
	_StorePage2State createState() => _StorePage2State();
}

class _StorePage2State extends State<StorePage2> {
	final CategoriesScroller categoriesScroller = const CategoriesScroller();
	ScrollController controller = ScrollController();
	bool closeTopContainer = false;
	double topContainer = 0;

	List<Widget> itemsData = [];

	
@override
void initState() {
	super.initState();
	controller.addListener(() {
		double value = controller.offset / 119;

		setState(() {
			topContainer = value;
			closeTopContainer = controller.offset > 50;
		});
		});
	}

@override
Widget build(BuildContext context) {
		final Size size = MediaQuery.of(context).size;
		//final double categoryHeight = size.height * 0.30;
		final double categoryHeight = (((size.height - 300) / 3) * 2) - 50;
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
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Container(
					width: size.width - 60,
					margin: const EdgeInsets.only(right: 20),
					height: categoryHeight,
					decoration: BoxDecoration(
						color: Colors.orange.shade400,
						borderRadius:
							const BorderRadius.all(Radius.circular(20.0))),
					child: Padding(
					padding: const EdgeInsets.all(12.0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						// ignore: prefer_const_literals_to_create_immutables
						children: <Widget>[
						const Text(
							"Big Square",
							style: TextStyle(
								fontSize: 25,
								color: Colors.white,
								fontWeight: FontWeight.bold),
						),
						const SizedBox(
							height: 10,
						),
						const Text(
							"20 Items",
							style: TextStyle(fontSize: 16, color: Colors.white),
						),
						],
					),
					),
				),
				categoriesScroller,
				],
			),
			),
		),
		);
	}
}

class CategoriesScroller extends StatelessWidget {
	const CategoriesScroller({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final double categoryHeight =((MediaQuery.of(context).size.height - 300) / 3) + 50;
			
		return SingleChildScrollView(
		physics: const BouncingScrollPhysics(),
      key: const Key('sections-scroll'),
		scrollDirection: Axis.horizontal,
		child: Container(
			margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
			child: FittedBox(
			fit: BoxFit.fill,
			alignment: Alignment.topCenter,
			child: Row(
				children: <Widget>[
				GestureDetector(
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                      const Text(
                        "Most\nFavorites",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      ],
                    ),
                    ),
                  ),
                ),
				Container(
					width: 200,
					margin: const EdgeInsets.only(right: 20),
					height: categoryHeight,
					decoration: BoxDecoration(
						color: Colors.blue.shade400,
						borderRadius:
							const BorderRadius.all(Radius.circular(20.0))),
					// ignore: avoid_unnecessary_containers
					child: Container(
					child: Padding(
						padding: const EdgeInsets.all(12.0),
						child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						// ignore: prefer_const_literals_to_create_immutables
						children: <Widget>[
							const Text(
							"Newest",
							style: TextStyle(
								fontSize: 25,
								color: Colors.white,
								fontWeight: FontWeight.bold),
							),
							const SizedBox(
							height: 10,
							),
							const Text(
							"20 Items",
							style: TextStyle(fontSize: 16, color: Colors.white),
							),
						],
						),
					),
					),
				),
				GestureDetector(
          onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SectionPage()))
                },
                key: const Key('section-box'),
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade400,
                      borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                      const Text(
                        "Super\nSaving",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      ],
                    ),
                    ),
                  ),
                ),
				],
			),
			),
		),
		);
	}
}
