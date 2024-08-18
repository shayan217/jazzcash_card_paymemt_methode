import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter jazzcash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'jazzcash flutter card payments'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({ required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('com.flutter.khurramdev');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                TextButton(
                  child: Center(child: Text("start")),
                  onPressed: () {
                    start();
                  },
                ),
              ],
            )
        )
    );
  }
  void start() async {
     Map<String,String> data ={
       "price":"400000",
       "Jazz_MerchantID":"01211234",  
       "Jazz_Password":"282avv8wdy",
       "Jazz_IntegritySalt":"wzhwbab21e",
       "paymentReturnUrl":"https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction"
     };
    String value="";
    try {
      value = await platform.invokeMethod("Print", data);
    } catch (e) {
      print(e);
    }
    print(value.toString());
  }
}