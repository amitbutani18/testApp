// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Some title'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Map<String, dynamic>> data = [
//     {'title': 'youtube', 'link': 'jdhjfhdjfh', 'init': false},
//     {'title': 'linkin', 'link': 'jdhjfhdjfh', 'init': false},
//     {'title': 'ghicjnhst', 'link': 'jdhjfhdjfh', 'init': false}
//   ];
//   int lenth;
//   int check;
//   List<TextEditingController> titleController = [];
//   List<TextEditingController> linkController = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     lenth = data.length;
//     check = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("Lenght" + lenth.toString());
//     List<Widget> children = new List.generate(data.length, (int i) {
//       print(" New Add $i" + data[i]['title']);
//       if (data[i]['init'] == false) {
//         print("In If");
//         titleController.add(
//           TextEditingController(
//             text: lenth < i ? '' : data[i]['title'],
//           ),
//         );
//         linkController.add(TextEditingController(text: data[i]['link']));
//         data[i]['init'] = true;
//       }

//       print("t" + titleController[i].text);
//       return inputWidget(
//         data[i],
//         i,
//         // titleController[i],
//         // linkController[i],
//       );
//     });

//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text(widget.title),
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.ac_unit),
//                 onPressed: () {
//                   for (var i = 0; i < data.length; i++) {
//                     print(titleController[i].text);
//                   }
//                 })
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: new Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 LimitedBox(
//                   maxHeight: 500,
//                   child: GridView(
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         // maxCrossAxisExtent: 200,
//                         childAspectRatio: 0.7 / 0.5,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 0,
//                         crossAxisCount: 2),
//                     children: children,
//                   ),
//                 )
//               ]),
//         ),
//         floatingActionButton: new FloatingActionButton(
//           child: new Icon(Icons.add),
//           onPressed: () {
//             setState(() {
//               data.add({'title': '', 'link': '', 'init': false});
//             });
//           },
//         ));
//   }

//   Widget inputWidget(
//     Map<String, dynamic> data,
//     int i,
//   ) {
//     return Container(
//       height: 100,
//       width: 500,
//       child: Column(
//         children: [
//           TextFormField(
//             // key: ValueKey('t$i'),
//             // initialValue: 'abcd',
//             controller: titleController[i],
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Title',
//               isDense: true, // Added this
//               contentPadding: EdgeInsets.all(8), // Added this
//             ),
//           ),
//           TextField(
//             // key: ValueKey('l$i'),
//             controller: linkController[i],
//             decoration: InputDecoration(
//                 labelText: "Link",
//                 hintStyle: TextStyle(color: Colors.white),
//                 fillColor: Colors.grey,
//                 contentPadding: EdgeInsets.symmetric(vertical: 0)),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:device_simulator/device_simulator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testApp/custompaint.dart';
import 'package:testApp/providers.dart';
import 'package:testApp/responsive.dart';
import 'PlanetCard.dart';
import 'CardDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Providers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: <String, WidgetBuilder>{
        //   '/cardDetails': (BuildContext context) {
        //     // return new CardDetails();
        //   }
        // },
        home: DeviceSimulator(
            brightness: Brightness.dark,
            enable: true,
            child: CustomPaintWidget()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _generateCards();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder App"),
        backgroundColor: Colors.purple,
      ),
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }

  List<Widget> _generateCards() {
    List<PlanetCard> planetCard = new List();
    planetCard.add(
      PlanetCard(
          "Mussorie",
          "https://www.tripsavvy.com/thmb/LTudD1VFIPILWGW5MoCsgBmhOGs=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/464741705-56a3c03d5f9b58b7d0d39809.jpg",
          70.0),
    );
    planetCard.add(
      PlanetCard(
          "Manali ",
          "https://www.tripsavvy.com/thmb/YGzlP0l5lE79cah0LdH8sSWe7EI=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-535240938-591c2d7b3df78cf5fa4919b5.jpg",
          80.0),
    );
    planetCard.add(PlanetCard(
        "Gangtok (Sikkim)",
        "https://www.tripsavvy.com/thmb/5X29hRjFEbE-5IYT3PFk30kqMZ4=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-675923006-5a82469c3418c6003689af24.jpg",
        90.0));
    planetCard.add(PlanetCard(
        "Darjeeling (West Bengal)",
        "https://www.tripsavvy.com/thmb/xbATyZ6fE8sMFYDrDXU7P1wnbgE=/650x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-503908231-591be3103df78cf5fa000b74.jpg",
        100.0));
    planetCard.add(
      PlanetCard(
          "Nainital (Uttarakhand)",
          "http://amazingindiablog.in/wp-content/uploads/2015/06/P5035083.jpg",
          110.0),
    );
    List<Widget> cardList = new List();

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.network(
                          planetCard[x].cardImage,
                          width: 320.0,
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return CardDetails(planetCard[x].cardImage, x);
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(250, 112, 19, 179),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: NetworkImage(planetCard[x].cardImage),
                                fit: BoxFit.cover),
                          ),
                          height: 480.0,
                          width: 320.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            planetCard[x].cardTitle,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}
