import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        //   backgroundColor: bgcolor,
        // ),
        // drawer: Drawer(
        //   child: Column(
        //     children: <Widget>[
        //       UserAccountsDrawerHeader(
        //         accountName: Text('Sumit balyan'), 
        //         accountEmail: Text('sumit.balyan@rsystems.com'),
        //         currentAccountPicture: CircleAvatar(
        //           backgroundImage: AssetImage('assets/uk.png'),
        //         ),),
        //       ListTile(
        //         title: Text('Home'),
        //         leading: Icon(Icons.home),
        //       ),
        //        ListTile(
        //         title: Text('Products'),
        //         leading: Icon(Icons.shopping_cart),
        //       ),
        //        ListTile(
        //         title: Text('Sttings'),
        //         leading: Icon(Icons.settings),
        //       )
        //     ],
        //   ),
        // ),
        backgroundColor: bgcolor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () async{
                         dynamic result= await Navigator.pushNamed(context, '/location');
                         setState(() {
                           data = {
                             'time': result['time'],
                             'location': result['location'],
                             'isDayTime': result['isDayTime'],
                             'flag': result['flag'],
                           };
                         });
                        }
                            ,
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.white,),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 66,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
