
import 'package:flutter/material.dart';

import 'package:cart_stepper/cart_stepper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Number Stepper View",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

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
              child: CartStepper(
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
              child: CartStepper(
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
                    child: CartStepper(
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
                    child: CartStepper(
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
                    child: CartStepper(
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
              child: CartStepper(
                count: _counterLimit,
                size: 30,
                didChangeCount: (count) {
                  if(count < 1){
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('数量不能小于 1 哦~'),backgroundColor: Colors.orangeAccent,));
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
