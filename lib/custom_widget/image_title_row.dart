import 'package:flutter/material.dart';
class ImageTitleRow extends StatelessWidget {

  final String title;
  final bool isSelected;

  Color defaultColor = Colors.white;
  Color defaultIconColor = Colors.black;
  Color selectColor = Colors.black;
//  Color selectColor =  Colors(0xFF353B50);


  double size = 70;
  IconData icon = Icons.image;

  ImageTitleRow({
    this.title,
    this.isSelected,
    this.size: 70,
    this.defaultColor = Colors.white,
    this.defaultIconColor = Colors.black,
    this.selectColor = Colors.black,
    this.icon = Icons.image
  });

  @override
  Widget build(BuildContext context) {

    if(isSelected)
    {
      defaultColor = selectColor;
      defaultIconColor = Colors.white;
    }
    else{
      defaultColor = Colors.white;
      defaultIconColor = selectColor;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon,color: defaultIconColor,),
              SizedBox(height: 2,),
              Text(title,style: TextStyle(
                  color: defaultIconColor
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
