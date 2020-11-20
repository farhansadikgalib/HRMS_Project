import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hrms/home.dart';




class HomeScreen extends StatelessWidget {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.deepOrangeAccent
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),

                      child:
                          Image.asset('assets/hrm.png', width: 75, height: 75),
                      //  child:Padding(padding: EdgeInsets.all(8.0)),
                      elevation: 10,
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text('HRMS',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.work_sharp, 'work', () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewDart()))}),
            CustomListTile(Icons.time_to_leave, 'Leave', () => {}),
            CustomListTile(Icons.money, 'Salary', () => {}),
            CustomListTile(Icons.watch, 'Office Time', () => {}),
            CustomListTile(Icons.login, 'Login', () => {}),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "welcome to HRMS project",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.card_giftcard,
          Icons.camera,
          Icons.pie_chart,
          Icons.person,
        ],
        onChange: (val) {
         // setState(() {
            _selectedItem = val;
          //});
        },
        defaultSelectedIndex: 1,
      ),
    );
  }

  Container buildNavBarItem(
    IconData icon,
    bool isActive,
    int index,
  ) {
    return Container(
      height: 50,
      //         width: MediaQuery.of(context).size.width / 5,
      decoration:
          BoxDecoration(color: isActive ? Colors.orangeAccent : Colors.white),
      child: Icon(icon),
    );
  }
}

//////////////// Nav drawer Tiles /////////////////////////////

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.deepOrangeAccent,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.orangeAccent))),
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                // margin: new EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////// Nav drawer Tiles /////////////////////////////



class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        @required this.iconList,
        @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 4, color: Colors.green),
            ),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.3),
              Colors.green.withOpacity(0.015),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
          // color: index == _selectedItemIndex ? Colors.green : Colors.white,
        )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}