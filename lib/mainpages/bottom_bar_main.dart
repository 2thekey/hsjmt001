import 'package:flutter/material.dart';

class BottomBar_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(25.0),
                //     topRight: Radius.circular(25.0)
                // ),
                color: Colors.white
            ),
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: <Widget>[
                            Icon(Icons.home, color: Color(0xFFEF7532)),
                            Icon(Icons.person_outline, color: Color(0xFF676E79)),
                            Icon(Icons.search, color: Color(0xFF676E79)),
                            Icon(Icons.shopping_basket, color: Color(0xFF676E79))
                        ],


                      )
                  ),

                ]
            )
        )
    );
  }
}