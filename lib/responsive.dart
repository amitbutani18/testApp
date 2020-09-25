import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testApp/providers.dart';
import 'package:testApp/test.dart';

class Responsive extends StatefulWidget {
  @override
  _ResponsiveState createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> with ChangeNotifier {
  TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  bool hello = true;
  set bar(bool value) {
    hello = value;
    notifyListeners();
    print(hello);
  }

  bool _click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: _click
            ? const EdgeInsets.only(bottom: 8.0)
            : const EdgeInsets.only(bottom: 0.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _click = _click ? false : true;
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 25,
            child: Icon(Icons.ac_unit),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: !_click ? 60.0 : 0.0,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                color: !_click ? Colors.white : Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      // body: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: AspectRatio(
      //     aspectRatio: 19 / 6,
      //     child: Container(
      //       height: 50.w,
      //       margin: EdgeInsets.symmetric(horizontal: 50),
      //       alignment: Alignment.center,
      //       color: Colors.amber,
      //       child: Text(
      //         "data",
      //         style: TextStyle(
      //           fontSize: ScreenUtil().setSp(50, allowFontScalingSelf: true),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 19 / 8,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 19 / 6,
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.green,
                  child: Row(
                    children: [
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //     color: Colors.amber,
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: 2,
                      //   child: AspectRatio(
                      //     aspectRatio: 1 / 1,
                      //     child: Container(
                      //       margin:
                      //           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ),
                      Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: AspectRatio(
                                aspectRatio: 3 / 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Provider.of<Providers>(context,
                                              listen: false)
                                          .changeColor(Colors.red);
                                    },
                                    color: Colors.red,
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Text(
                                          "Change Color of Contanier 1",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        )),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: AspectRatio(
                                aspectRatio: 3 / 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: RaisedButton(
                                    onPressed: () {
                                      Provider.of<Providers>(context,
                                              listen: false)
                                          .changeSecColor(Colors.purple);
                                    },
                                    color: Colors.blue,
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Text(
                                          "Change Color of Container 2",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        )),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 3 / 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Test()));
                                },
                                color: Colors.purple,
                                child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Go to test page",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 9 / 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textController,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: RaisedButton(
                                onPressed: () {
                                  Provider.of<Providers>(context, listen: false)
                                      .changeMessage(textController.text);
                                },
                                child: Text("Change Text")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
