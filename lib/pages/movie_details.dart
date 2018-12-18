import 'package:flutter/material.dart';
import 'package:flutter_demo/app/item_provider.dart';
class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> with TickerProviderStateMixin{

  TabController _controller;
  PageController _pageController;
  int tab = 0;
  final imagePlaceHolder = "assets/image/picture.png";
  final image = "";
  String title = "Movie Title";
  int year = 2018;

  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);
    _pageController = new PageController(initialPage: tab);
  }

  @override
  Widget build(BuildContext context) {



    List<Widget> getMovieList()
    {
      List<Widget> list = new List();
      for(var details in ItemProvider.getMovieList())
        {
          list.add(
            Column(
              children: <Widget>[
                FadeInImage.assetNetwork(
                    width: 100,
                    height: 100,
                    placeholder: imagePlaceHolder,
                    image:image),
                Text(details.title,
                style: Theme.of(context).textTheme.body2.copyWith(
                  fontSize: 16
                ),),
                Text("${details.year}",
                style: Theme.of(context).textTheme.body2.copyWith(
                  fontSize: 16
                ),),
                RaisedButton(onPressed: ()
                {
                  setState(() {
                    year = details.year;
                    title = details.title;
                    _pageController.jumpToPage(1);
                  });
                },
                  color: Theme.of(context).primaryColor,
                  child: Text("Show Details",
                    style: Theme.of(context).textTheme.body2.copyWith(
                      color: Colors.white
                    ),
                  ),
                )
              ],
            )
          );
        }

      return list;
    }
    Widget headerView()
    {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: FadeInImage.assetNetwork(
                        placeholder: imagePlaceHolder,
                        image: image)
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Details",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.body2.copyWith(
                                  color: Theme.of(context).primaryColor
                              )
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.video_call,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 8,),
                            Text("Movie Title",style: Theme.of(context).textTheme.body2,)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 8,),
                            Text("Release Year",style: Theme.of(context).textTheme.body1,)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 8,),
                            Text("Rating",style: Theme.of(context).textTheme.body1,)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.disc_full,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(width: 8,),
                            Text("Genere",style: Theme.of(context).textTheme.body1,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    }

    _controller.addListener(()
    {
//      setState(() {
      print("tabb ${_controller.previousIndex}");
      _pageController.jumpToPage(_controller.index);
//      });
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Details"),
        ),
        body: Column(
          children: <Widget>[
            headerView(),
            DefaultTabController(length: 2,
              child: TabBar(
                controller: _controller,
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: <Tab>[
                  new Tab(
                    text: "TAB1",
                  ),
                  new Tab(text: "TAB2"),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index)
                {
                  _controller.animateTo(index);
                },
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                  children: getMovieList(),
                  ),
                  MovideDetailsView(
                    title: title,
                    year: year,
                  )
                ],
              ),
            )
          ],
        )
    );
  }

}

class MovideDetailsView extends StatelessWidget {

  final imagePlaceHolder = "assets/image/picture.png";
  final image = "";
  final String title;
  final int year;
  final double rating;
  final String genere;

  MovideDetailsView({
    this.title,
    this.year,
    this.rating = 3,
    this.genere = "Genere"
  });

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: FadeInImage.assetNetwork(
                placeholder:imagePlaceHolder,
                image: image),
            width: 150,
            height: 150,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text("Details",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.body2.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20
              )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.video_call,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 8,),
            Text(title,style: Theme.of(context).textTheme.body2,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.calendar_today,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 8,),
            Text("$year",style: Theme.of(context).textTheme.body1,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 8,),
            Text("$rating",style: Theme.of(context).textTheme.body1,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.disc_full,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 8,),
            Text("$genere",style: Theme.of(context).textTheme.body1,)
          ],
        ),

      ],
    );
  }
}

