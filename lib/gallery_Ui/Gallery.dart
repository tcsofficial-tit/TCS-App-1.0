import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'first_widget.dart';
import 'package:tcsflutter_app/home/home_screen.dart';



class Gallery extends StatefulWidget {

  @override

  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<Gallery> {

  static List<String> _images = ['5.jpg','6.jpg','7.jpg','14.jpg','19.jpg',"attitude_smile_and_picture_perfect.jpg","Black_on_white_without_bg.png","collecting_memories.jpg","forever_and_beyound.JPG","friends_forever.JPG",
    "it_s_just_called_best.JPG","let_me_feel_the_breeze.JPG",
    "our_merchandise_launch.jpg","sing_like_a_melody.jpg","smile_best_medicine_ever_made.JPG",'the_boys_gang.JPG','the_girls_corner.jpg','the_party_peoples.jpg','tough_and_strong.jpg',
    'we_represent_hand_together_forever.jpg',"yes_i_am_childish.jpg"];
  List<String> _title = ["Are You A Gamer?","The Farewell","Our Respected Mentor","The Initiators","Wanna Register? Come Here","Attitude, Smile And Picture Perfect","TCS Logo","Collecting memories","I Forever and Beyound","Friends Forever",
    "It's Just Called The Best","Let Me Feel The Breeze","Our Merchandise Launch",'Sing Like A Melody',
    "Smile Best Medicine Ever Made","The Boys Gang","The Girls Corner","The Party Peoples",'Tough And Strong','We Represent Hand Together & Forever','Yes I am Childish'/*,'abcd'*/];
  List<String> _description = ["im1.jpg","im2.jpg","im3.jpg","im4.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg","im5.jpg"];
  int x = 0;

  Widget _image = Image.asset("assets/${_images[0]}",height: 100,width: 100,);

  Widget _myAnimatedWidget = FirstWidget();

  var selectedItem = null;


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(

        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: HexColor('#0f0f0f'),
            elevation: 6,
            leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () =>  Navigator.pop(context),
            ),
            title: Text('Gallery'),
          ),
          backgroundColor: HexColor('#282c35'),
          body:
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 4000),
                //Enable this for ScaleTransition
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    child: child,
                    turns: animation,);
                },

                child:  Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 450,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                                image: AssetImage(_images[x]),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                      ),
                      Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 24,top: 5,bottom: 5,right: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      _title[x],style: TextStyle(
                                      fontFamily: 'IndieFlower',
                                      fontSize: 20,color: Colors.white,
                                    ),),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 12,top: 0,bottom: 0,right: 12),
                decoration: BoxDecoration(
                ),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: 'image$index',
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            x = index;
                            _image = Image.asset("${_images[x]}");

                            for(var item in _images){
                              if(item == _images[index]){
                                selectedItem = Border.all(color: Colors.blueGrey,style: BorderStyle.solid,width: 3);
                              }
                              else{
                                selectedItem = Border.all(color: Colors.blueGrey,style: BorderStyle.solid,width: 3);
                              }
                            }
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: selectedItem,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(_images[index]),
                              fit: BoxFit.cover,


                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

