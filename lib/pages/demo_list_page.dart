import 'package:flutter/material.dart';
import 'package:flutter_demo/app/item_provider.dart';
import 'package:flutter_demo/custom_widget/custom_spinner.dart';
import 'package:flutter_demo/custom_widget/image_title_row.dart';

class DemoList extends StatefulWidget {
  @override
  _DemoListState createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {

//  List<String> list = ["Data", "Akash"];
  int selected = 0;
  String _activity = "1";

  List<SpinnerItem<String>> _dropDownloadData()
  {
    List<SpinnerItem<String>> dropDownList = new List();
    dropDownList.add(SpinnerItem(child: Text('Value 1'),
      value: "1",
    ));dropDownList.add(SpinnerItem(child: Text('Value 2'),
      value: "2",
    ));dropDownList.add(SpinnerItem(child: Text('Value 3'),
      value: "3",
    ));
    dropDownList.add(SpinnerItem(child: Text('Value 4'),
      value: "4",
    ));
    return dropDownList;
  }

  @override
  Widget build(BuildContext context) {

    Color color = Color(0xFF353B50);
//    _dropDownloadData();
    return Scaffold(
      appBar: AppBar(title: Text("Demo List"),),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Text("Demo",),
                SizedBox(height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ItemProvider.getCardRowList().length,
                      itemBuilder: (BuildContext context,int index){
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: ImageTitleRow(
                            icon: ItemProvider.getCardRowList()[index].icon,
                            title: ItemProvider.getCardRowList()[index].title,
                            isSelected: index == selected,
                            selectColor: color ,
                            defaultIconColor:color,
                          ),
                        );
                      }),
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.location_on,color: color,),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ListTile(leading: Icon(Icons.calendar_today,color:color,),)
                      ),
                      Transform.rotate(
                        child: Icon(Icons.compare_arrows,color: color,), angle: 80,
                      ),
                      Expanded(
                          child: ListTile(leading: Icon(Icons.calendar_today,color: color,),)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                        labelText: 'Activity',
                        hintText: 'Choose an activity',
                        border: InputBorder.none
                    ),
//              isEmpty: _activity == null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomSpinner<String>(
                        value: _activity,
                        onChanged: (String newValue) {
                          _activity = newValue;

                          setState(() {
                          });
                        },
                        items: _dropDownloadData(),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    )
                  ],
                ),

//            new Container(
//                color: Colors.white,
//                child: new Center(
//                    child:
//                    new DropdownButton(
//                      onChanged: null,
//                      items: _dropDownloadData(),
//                    )
//                )
//            )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              color: color,
            ),
          )

        ],
      ),
    );
  }
}


