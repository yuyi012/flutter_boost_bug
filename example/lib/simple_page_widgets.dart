import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_boost_example/platform_view.dart';

class TabRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Route"),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // FlutterBoost.singleton.open("second", exts: {'animated': true});
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return MidRouteWidget();
            // }));
            FlutterBoost.singleton.open("second", exts: {"animated": true}).then((Map value) {
              print("call me when page is finished. did recieve second route result $value");
            });
          },
          child: Text('Open mid route'),
        ),
      ),
    );
  }
}

class MidRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mid Route"),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            FlutterBoost.singleton.open("second", exts: {"animated": true}).then((Map value) {
              print("call me when page is finished. did recieve second route result $value");
            });
          },
          child: Text('open second page!'),
        ),
      ),
    );
  }
}

class SecondRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            BoostContainerSettings settings = BoostContainer.of(context).settings;
            FlutterBoost.singleton.close(settings.uniqueId, result: {"result": "data from second"});
          },
          child: Text('Go back with result!'),
        ),
      ),
    );
  }
}
