import 'package:number_stepper/number_stepper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Number Stepper View",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterInit = 0;
  int _counter = 1;
  int _counterLimit = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Builder(builder: (BuildContext context) {
        return Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  '普通调用:',
                ),
              ),
            ),
            Center(
              child: NumberStepper(
                count: _counterInit,
                didChangeCount: (count) {
                  setState(() {
                    _counterInit = count;
                  });
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  '纵向:',
                ),
              ),
            ),
            Center(
              child: NumberStepper(
                count: _counter,
                axis: Axis.vertical,
                didChangeCount: (count) {
                  setState(() {
                    _counter = count;
                  });
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  '不同尺寸/设置颜色:',
                ),
              ),
            ),
            Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: NumberStepper(
                      count: _counter,
                      size: 20,
                      didChangeCount: (count) {
                        setState(() {
                          _counter = count;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: NumberStepper(
                      count: _counter,
                      size: 30,
                      deActiveForegroundColor: Colors.red,
                      activeForegroundColor: Colors.white,
                      activeBackgroundColor: Colors.pinkAccent,
                      didChangeCount: (count) {
                        setState(() {
                          _counter = count;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: NumberStepper(
                      count: _counter,
                      size: 80,
                      didChangeCount: (count) {
                        setState(() {
                          _counter = count;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  '限制最小值:',
                ),
              ),
            ),
            Center(
              child: NumberStepper(
                count: _counterLimit,
                size: 30,
                didChangeCount: (count) {
                  if(count < 1){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('数量不能小于 0 哦~'),backgroundColor: Colors.orangeAccent,)
                    );
                    return;
                  }
                  setState(() {
                    _counterLimit = count;
                  });
                },
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      );
      }),
      
    );
  }
}
