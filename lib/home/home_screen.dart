import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tcsflutter_app/aboutUs_screen/AboutUs.dart';
import 'package:tcsflutter_app/gallery_Ui/Gallery.dart';
import 'package:tcsflutter_app/regitration.dart';
import 'package:tcsflutter_app/customText.dart';
import 'package:tcsflutter_app/customColors.dart';
import 'package:tcsflutter_app/tcs_members.dart';
import 'package:tcsflutter_app/tcs_alumini.dart';
import 'package:tcsflutter_app/tcs_app_developers.dart';
import 'package:tcsflutter_app/terms_ui/terms_use_ui.dart';
import 'package:tcsflutter_app/feedback/feedback_ui.dart';
import 'package:quick_feedback/quick_feedback.dart';
import'package:tcsflutter_app/placemrnt.dart';
import 'package:tcsflutter_app/login_screen/login_main.dart';
var GlobalContext;

class TcsHomeScreen extends StatelessWidget {
  User result = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _drawerOpenKey = new GlobalKey<ScaffoldState>();
  int x=1;
  @override
  Widget build(BuildContext context) {
    GlobalContext=context;
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        key: _drawerOpenKey,
        backgroundColor: HexColor('#282c35'),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("fblogo.jpg"),
                    fit: BoxFit.cover,
                  ),

                ),
                child: Row(
                    children: <Widget> [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 72, bottom: 94,top: 13),
                        child: CustomHeader(
                          text: 'TCS Bar',
                        ),
                      ),

                    ]
                ),
              ),
              UserAccountsDrawerHeader(
                decoration:BoxDecoration(
                ),
                currentAccountPicture: Container(
                  child: result.photoURL!=null?CircleAvatar(backgroundImage: NetworkImage(result.photoURL),)
                      :CircleAvatar(
                    child: Text(result.email[0],style: TextStyle(fontSize: 30),),
                  )
                ),
                accountEmail: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .reference()
                        .child("Users")
                        .child(result.uid)
                        .once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.value['email'],style: TextStyle(color: textColor ));
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                accountName: FutureBuilder(
                    future: FirebaseDatabase.instance
                        .reference()
                        .child("Users")
                        .child(result.uid)
                        .once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.value['name'],style: TextStyle(color: textColor),);
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ),
              ListTile(
                title: CustomDescription(text: 'Profile'),
                onTap: () {
                },

              ),

              ListTile(
                title: CustomDescription(text: 'Logout'),
                onTap: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut().then((res) {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => EmailLogIn()),
                    //         (Route<dynamic> route) => false);
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginMain()));
                  }
                  );
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginMain()));
                },
              ),
              ListTile(
                title: CustomDescription(text: 'About'),
                onTap: () {
                  Navigator.push(
                    context,MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
              ),

              ListTile(
                title: CustomDescription(text: 'Help'),
                onTap: () {
                },
              ),

              ListTile(
                  contentPadding: EdgeInsets.only(left:16,top: 100),
                  title: CustomDescription(text: 'Developed By TCS App Team'),
                  subtitle: CustomDescription(text: 'version 1.1.011'),
                  onTap: null
              ),
            ],
          ),
        ),

        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              flexibleSpace:  FlexibleSpaceBar(
                background:  SizedBox(
                  height: 70.0,
                  width: 80.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 40, 5, 40),
                    margin: EdgeInsets.fromLTRB(20, 60, 20, 50),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'logo.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 400,
              leading: IconButton(
                icon: Icon(Icons.menu,color: Colors.white,),
                onPressed: () {
                  _drawerOpenKey.currentState.openDrawer();
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: Text(''),
              ),
              title: CustomHeader(
                text: 'TCS App',
              ),
              actions: <Widget>[
                // NamedIcon(
                //   text: 'Notifications',
                //   iconData: Icons.notifications,
                //   notificationCount: 5,
                //   onTap: (){
                //   },
                // )
              ],

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(7000,1600),
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.school),
                      splashColor: splashColor,
                      onPressed: (){},
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Courses",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),

                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.assignment_turned_in),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => registrationForm()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Registration",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.image),
                      splashColor: splashColor,
                      onPressed: (){
                         Navigator.push(
                           context,MaterialPageRoute(builder: (context) => Gallery()),
                         );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Gallery",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.business),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => PlacementPage()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Placement",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.people),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TcsAlumni()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Alumni",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.code),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TcsDevelopers()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Developers",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.perm_identity),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TcsMembers()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Members",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.filter_none),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => TermsUseUI()),
                        );

                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Test Series",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.personal_video),
                      splashColor: splashColor,
                      onPressed: (){
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) => AboutUs()),
                        );
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("About Us",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                      bottom: BorderSide(
                        color: gridWhite,width: 2,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(15).add(EdgeInsets.fromLTRB(0, 0, 0, 15)),
                  child: GridTile(
                    child: IconButton(
                      iconSize: 90,
                      color: gridWhite,
                      icon: Icon(Icons.format_align_justify),
                      splashColor: splashColor,
                      onPressed: (){
                        _showFeedback(context);
                      },
                      alignment: Alignment.topCenter,
                    ),
                    footer: Text("Feedback",textAlign: TextAlign.center,textScaleFactor: 1.7,style: TextStyle(
                      fontStyle: FontStyle.italic,color: gridWhite,fontFamily: "FreightSans",
                    ),),
                  ),
                ),

              ],
            ),
          ],
        ),


      ),
    ) ;
  }
}
void _showFeedback(context) {
  showDialog(
    context: context,
    builder: (context) {
      return QuickFeedback(
        title: 'Leave a feedback', // Title of dialog
        showTextBox: true, // default false
        textBoxHint:
        'Share your feedback', // Feedback text field hint text default: Tell us more
        submitText: 'SUBMIT', // submit button text default: SUBMIT
        onSubmitCallback: (feedback) {
          print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
          Navigator.of(context).pop();
        },
        askLaterText: 'ASK LATER',
        onAskLaterCallback: () {
          print('Do something on ask later click');
        },
      );
    },
  );
}

