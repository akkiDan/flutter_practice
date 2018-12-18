import 'package:flutter/material.dart';
import 'package:flutter_demo/app/constants.dart';
import 'package:flutter_demo/app/item_provider.dart';

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

  void onItemClick(int i)
  {
    switch(i)
    {
      case 0:
        Navigator.of(context).pushNamed(Constants.FORMDEMO.toString());
        break;
      case 1:
        Navigator.of(context).pushNamed(Constants.DEMOLIST.toString());
        break;
      case 2:
        Navigator.of(context).pushNamed(Constants.MOVIEDETAILS.toString());
        break;
    }
  }

  List<Widget> getHomeList()
  {
    List<Widget> list = new List();
    for(int i=0;i<ItemProvider.getHomeList().length;i++)
    {
      list.add(
          GestureDetector(
            onTap: ()=> onItemClick(i),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
              child: Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(ItemProvider.getHomeList()[i]),
                  ),
                ),
              ),
            ),
          )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: getHomeList().length,
          itemBuilder: (BuildContext context,int index)
          {
            List<Widget> list = getHomeList();
            return list[index];
          }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}