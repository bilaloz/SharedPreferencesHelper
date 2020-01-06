import 'package:flutter/material.dart';
import 'package:sharedpreference/models/index.dart';
import 'package:sharedpreference/sharedpreferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  SharedPreferencesHelper sharedPreferencesHelper;

  void _incrementCounter() async {
    bool result = await sharedPreferencesHelper.setInt(
        SharedPreferencesKey.totalCount, 1);
    print(result); //true or false
    sharedPreferencesHelper
        .getInt(SharedPreferencesKey.totalCount)
        .then((onValue) {
      setState(() {
        _counter = onValue;
      });
    });
    _saveUser();
  }

  void _saveUser() async {
    User user = User();
    user.userName = "Bilal";
    user.userLastName = "Oz";
    user.userTc = 12345;
    user.isStudent = true;

    Adres userAddress = Adres();
    userAddress.adress = "İzmir";

    Phone phoneOne = Phone();
    phoneOne.phoneGSM = "AGSM";
    phoneOne.phoneNumber = 1234567;

    Phone phoneTwo = Phone();
    phoneOne.phoneGSM = "BGSM";
    phoneOne.phoneNumber = 8713123;

    List<Phone> phoneList = List<Phone>();
    phoneList.add(phoneOne);
    phoneList.add(phoneTwo);

    user.adres = userAddress;
    user.phone = phoneList;

    sharedPreferencesHelper.setList(SharedPreferencesKey.userList, user);

    _getUser();
  }

  void _getUser() {
    UserList getList = UserList();

    sharedPreferencesHelper.getList(SharedPreferencesKey.userList).then((list) {
      getList.userList = list;
      for (User user in getList.userList) {
        print(user.userName);
      }
    });
  }

  void _setModel() {
    User user = User();
    user.userName = "Deneme";
    user.userLastName = "Deneme";
    user.userTc = 12345;
    user.isStudent = true;

    Adres userAddress = Adres();
    userAddress.adress = "İzmir";

    Phone phoneOne = Phone();
    phoneOne.phoneGSM = "AGSM";
    phoneOne.phoneNumber = 1234567;

    Phone phoneTwo = Phone();
    phoneOne.phoneGSM = "BGSM";
    phoneOne.phoneNumber = 8713123;

    List<Phone> phoneList = List<Phone>();
    phoneList.add(phoneOne);
    phoneList.add(phoneTwo);

    user.adres = userAddress;
    user.phone = phoneList;

    sharedPreferencesHelper.setModel(SharedPreferencesKey.userList, user);
    _getModel();
  }

  void _getModel() {
    sharedPreferencesHelper
        .getModel(SharedPreferencesKey.userList)
        .then((model) {
      print(model.userName);
    });
  }

  @override
  void initState() {
    super.initState();
    sharedPreferencesHelper = SharedPreferencesHelper();
  }

  @override
  Widget build(BuildContext context) {

    _setModel();
    _getModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
