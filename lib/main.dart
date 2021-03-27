import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'MemberList.dart';
import 'Member.dart';
import 'Hipo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Members Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Members'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MemberList members;
  MemberList filteredMembers;
  SearchBar searchBar;
  String search;
  List<AssetImage> imageList = [AssetImage("assets/avatar1.png"), AssetImage("assets/avatar2.png"), AssetImage("assets/avatar3.png"), AssetImage("assets/avatar4.png")];

  Future<String> makeRequest() async{
    String data = await DefaultAssetBundle.of(context).loadString("assets/hipo.json");
    Map<String, dynamic> jsonResult = jsonDecode(data);
    setState(() {
      members = MemberList.fromJson(jsonResult["members"]);
      filteredMembers = new MemberList.fromMemberList(members);
    });
  }

  void add(Member member){
    members.list.add(member);
    setState(() {
      filteredMembers = new MemberList.fromMemberList(members);
    });
  }

  void filter(String name){
    filteredMembers.list.clear();
    for(int i = 0; i < members.list.length; i++){
      if( members.list[i].name.toLowerCase().contains(name.toLowerCase()))
        setState(() {
          filteredMembers.list.add(members.list[i]);
        });
    }
  }

  @override initState(){
    this.makeRequest();
    searchBar = new SearchBar(
      setState: setState,
      clearOnSubmit: false,
      onChanged: (search){
        filter(search);
      },
      onSubmitted: (search){
        filter(search);
      },
      onClosed: (){
        filter("");
      },
      buildDefaultAppBar: buildAppBar,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Members'),
        actions: [searchBar.getSearchAction(context)]
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: searchBar.build(context),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            new ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredMembers.list.length,
              itemBuilder: (BuildContext context, i){
                return Container(
                  margin: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: new BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(
                      width: 1.0,
                    ),
                  ),
                  child: new ListTile(
                    title: new Text(filteredMembers.list[i].name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text("Age: " + filteredMembers.list[i].age.toString()),
                        new Text("Location: " + filteredMembers.list[i].location.toString()),
                      ],
                    ),
                    leading: new CircleAvatar(
                      backgroundImage: imageList[i%4],
                      backgroundColor: Colors.grey[100],
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (BuildContext context) => new ProfilePage(filteredMembers.list[i], i)));
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        tooltip: 'Add',
        label: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text('ADD NEW MEMBER',
            style: TextStyle(color: Colors.white),),
        ),
        onPressed: (){
          Hipo myHipo = Hipo("Intern", 0);
          Member me = Member("Onuralp Avci", 20, "Bursa", "oavci1625", myHipo);
          add(me);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ProfilePage extends StatelessWidget{
  List<AssetImage> imageList = [AssetImage("assets/avatar1.png"), AssetImage("assets/avatar2.png"), AssetImage("assets/avatar3.png"), AssetImage("assets/avatar4.png")];
  ProfilePage(this.data, this.index);
  final data;
  final index;
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text("Profile - " + data.name)
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
                  image: new DecorationImage(image: imageList[index%4]),
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
                  Text('Location:          ',
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
                  Text('Github:              ',
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
                  Text('Position:            ',
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
                  Text('Years in hipo:   ',
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