import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class profile extends StatelessWidget {

  _linkedinURL(String $link_id) async
  {
    var url = /*'https://linkedin.com/in/' + */$link_id;
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }

  String name;
  String skill;
  String batch;
  String linkedinurl;
  String pic;

  profile({this.name, this.skill, this.batch, this.linkedinurl, this.pic});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 20,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 510,
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 0,
                      blurRadius: 15.0,
                      offset: Offset(5.0, 5.0)
                  )
                ],
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(pic,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /*CircleAvatar (
                        backgroundImage: AssetImage(pic),
                        radius:100,
                      ),*/
                    SizedBox(height: 20),
                    Text(
                      '\n' + name +
                          '\n\n' + skill +
                          '\n\n' + batch,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton.icon(
                      color: Colors.grey[900],
                      onPressed: () {
                        _linkedinURL(linkedinurl);
                      },
                      icon: Icon(Icons.format_align_justify,
                        color: Colors.white,
                      ),
                      label: Text('LinkedIn Profile',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
