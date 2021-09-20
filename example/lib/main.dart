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
        title: "Cart Stepper View",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterInit = 0;
  int _counter = 1;
  int _counterLimit = 1;

  double _dCounter = 0.0;

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
                  child: Text('普通调用:'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartStepperInt(
                      radius: Radius.zero,
                      elevation: 7,
                      count: _counterInit,
                      didChangeCount: (count) {
                        setState(() {
                          _counterInit = count;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartStepperDouble(
                      count: _dCounter,
                      stepper: 0.01,
                      didChangeCount: (count) {
                        setState(() {
                          _dCounter = count;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('纵向:'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartStepperInt(
                      count: _counter,
                      axis: Axis.vertical,
                      didChangeCount: (count) {
                        setState(() {
                          _counter = count;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartStepperDouble(
                      count: _dCounter,
                      stepper: 0.01,
                      axis: Axis.vertical,
                      didChangeCount: (count) {
                        setState(() {
                          _dCounter = count;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('不同尺寸/设置颜色:'),
                ),
              ),
              Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: CartStepperInt(
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
                      child: CartStepperInt(
                        count: _counter,
                        radius: Radius.zero,
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
                      child: CartStepperInt(
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
                  child: Text('限制最小值:'),
                ),
              ),
              Center(
                child: CartStepperInt(
                  count: _counterLimit,
                  radius: Radius.circular(3),
                  size: 30,
                  didChangeCount: (count) {
                    if (count < 1) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('数量不能小于 1 哦~'),
                        backgroundColor: Colors.orangeAccent,
                      ));
                      return;
                    }
                    setState(() {
                      _counterLimit = count;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        );
      }),
    );
  }
}
