import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  List<String> imageLocations = ["assets/avatar1.png", "assets/avatar2.png", "assets/avatar3.png", "assets/avatar4.png"];
  ProfilePage(this.data, this.index);
  final data;
  final index;
  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(
          title: new Text("Profil - " + data.name)
      ),
      body:
      new Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                new Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(image: AssetImage(imageLocations[index%4])),
                      borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
                      border: new Border.all(
                        color: Colors.red,
                        width: 4.0,
                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(data.name,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(data.age.toString(),
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  child: Divider(
                    color: Colors.red,
                    thickness: 5,
                  ),
                  height: 40.0,
                ),
                Row(
                  children: [
                    Text('Konum:         ',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(data.location,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('Github:          ',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(data.github,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('Pozisyon:      ',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(data.hipo.position,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('Deneyim:      ',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(data.hipo.yearsInHipo.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      )
  );
}