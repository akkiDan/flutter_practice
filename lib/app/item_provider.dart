
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/main_menu.dart';

class ItemProvider{

  static List<String> getHomeList()
  {
    List<String> list = new List();
    list.add("Form Demo");
    list.add("Demo List");
    list.add("Movie Details");
    return list;
  }

  static List<MainMenuItem> getCardRowList()
  {
    List<MainMenuItem> list = new List();
    list.add(MainMenuItem(Icons.store, "Cafe"));
    list.add(MainMenuItem(Icons.blur_circular, "Culture"));
    list.add(MainMenuItem(Icons.nature, "Nature"));
    list.add(MainMenuItem(Icons.landscape, "Landscape"));
    list.add(MainMenuItem(Icons.card_membership, "Night Clib"));
    return list;
  }

  static List<MovieDetails> getMovieList()
  {
    List<MovieDetails> list = new List();
    list.add(MovieDetails("Cafe",2018));
    list.add(MovieDetails("Culture",2018));
    list.add(MovieDetails("Nature",2018));
    list.add(MovieDetails("Landscape",2018));
    list.add(MovieDetails("Night Clib",2018));
    return list;
  }

}