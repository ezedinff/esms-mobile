import 'package:esms/shared/bottom_nav.dart';
import 'package:esms/shared/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esms/services/services.dart';
import 'package:esms/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProjectScreen extends StatelessWidget {
  Widget _simplePopup(Project project) => PopupMenuButton<int>(
    icon: Icon(Icons.more_vert, color: Colors.white, size: 30.0),
      color: Color.fromRGBO(64, 75, 96, 1),
    onSelected: (i) => onPopMenuSelected(project, i),
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text("Show API Key", style: TextStyle(color: Colors.white),),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Deactivate", style: TextStyle(color: Colors.white),),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Remove", style: TextStyle(color: Colors.white),),
      ),
    ],
  );
  onPopMenuSelected(Project project, selected) {
    switch(selected) {
      case 1:
        print("showing the key");
        break;
      case 2:
        print("D/A the project");
        break;
      case 3:
        print("");
        break;
    }
  }
  Widget makeListTile(Project project) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.business_center, color: Colors.white, size: 24.0,),
        ),
        title: Text(
          project.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: project.active ? Colors.green : Colors.red),
            Text(project.active ? "Active" : "Suspended", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:  _simplePopup(project))
        ;//IconButton(icon: Icon(Icons.more_vert, color: Colors.white, size: 30.0), onPressed:,));
  }

  Widget makeCard(Project project, color) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(project),
      ),
    );
  }

  var cards = [
    {
      "title": "Project 1",
      "active": false
    },
    {
      "title": "Project 2",
      "active": true
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white),
                  Text('Create Project', style: TextStyle(color: Colors.white),)
                ],
              ),
            )
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.66,
          child: FutureBuilder(
            future: Global.projectRef.getData(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if(snap.hasData) {
                List<Project> projects = snap.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: projects.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return makeCard(projects[index], projects[index].active ? Colors.green : Colors.red);
                    });
              } else {
                return LoadingScreen() ;
              }
            },
          )
        )
      ],
    );
  }
}
