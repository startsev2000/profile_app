import 'package:flutter/material.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Profile profile = Profile(
      image: AssetImage('assets/ElonMusk.jpg'),
      name: 'Elon',
      surname: 'Musk',
      description: '',
      age: 49,
      education: 'Mostly self-educated',
      job: 'Tesla, SpaceX',
      city: 'Los Angeles',
      information: [
        'Inventor of Tesla',
        'Sent rocket to SpaceX',
        'Makes new system of education',
        'Desires to explore Mars'
      ]);

  List<String> printedProperties = ['age', 'education', 'job', 'city'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.red[900],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: profile.image,
                    radius: 64,
                  ),
                ),
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      '${profile.name} ${profile.surname}',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                    child: Text(
                      '${profile.checkDescription()}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[500],
                      ),
                    )),
              ),
              SizedBox(height: 5.0),
              Divider(height: 15.0, color: Colors.red[900]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: printedProperties.map((property) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              '${property[0].toUpperCase()}${property.substring(1)}: ',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('${profile.get('$property')}',
                              style: TextStyle(fontSize: 20.0)),
                        ],
                      ),
                      SizedBox(height: 5.0)
                    ],
                  );
                }).toList(),
              ),
              Text('More information: ',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: profile.information.map((phrase) {
                  return Text(
                    '$phrase',
                    style: TextStyle(fontSize: 20.0),
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }
}
