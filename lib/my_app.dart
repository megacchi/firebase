import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_app/page/analytics/analytics.dart';
import 'package:firebase_app/page/authentication/authentication.dart';
// import 'package:firebase_app/page/crashlytics/crashlytics.dart';
// import 'package:firebase_app/page/firestore/firestore.dart';
// import 'package:firebase_app/page/storage/storage.dart';
// import 'package:firebase_app/widget/my_card.dart';


class MyApp extends StatelessWidget {
  // https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_analytics/firebase_analytics/example/lib/main.dart
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Analytics
      navigatorObservers: <NavigatorObserver>[observer],
      title: 'Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Firebase', analytics: analytics, observer: observer),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  final String title;

  MyHomePage({Key key, this.title, this.analytics, this.observer}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(analytics, observer);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.analytics, this.observer);
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

//      body: _buildBodyGrid(),
      body: _buildBodyContainer(),
    );
  }

  Widget _buildBodyContainer() {
    return Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.all(4.0),
      child: Column(children: [
        MyCard(icon: Icons.person, title: 'Authentication', movePage: AuthenticationPage(title: 'Firebase Auth')),
        // MyCard(icon: Icons.fireplace, title: 'Firestore', movePage: FirestorePage(title: 'Firestore')),
        // MyCard(icon: Icons.analytics, title: 'Analytics', movePage: AnalyticsPage(title: 'Analytics')),
        // MyCard(icon: Icons.storage, title: 'Storage', movePage: StroragePage(title: 'Storage')),
        // MyCard(icon: Icons.broken_image_outlined, title: 'Crashlytics', movePage: CrashlyticsPage(title: 'Crashlytics')),
      ]),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
