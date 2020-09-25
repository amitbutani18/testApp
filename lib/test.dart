import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testApp/providers.dart';

// class Test extends StatefulWidget with ChangeNotifier {
//   void changeValue() {
//     print("Amit");
//     notifyListeners();
//   }

//   @override
//   _TestState createState() => _TestState();
// }

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Consumer<Providers>(builder: (context, provider, child) {
            print(provider.color);
            return Column(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Text("Container 1"),
                    color:
                        provider.color == null ? Colors.green : provider.color),
                Container(
                  height: 100,
                  width: 100,
                  child: Text("Container 2"),
                  color: provider.secColor == null
                      ? Colors.blue
                      : provider.secColor,
                ),
                Text(provider.msg),
              ],
            );
          }),
        ),
      ),
    );
  }
}
