import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';


class TcsAlumni extends StatefulWidget {
  TcsAlumni({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TcsAlumni> {

  @override
  Widget build(BuildContext context) {

    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    //List<String>linkedinurl = [""];
    List<String>names = ["Gaurav Manchanda","Don't Know","Don't Know","Diksha Mehta","Arun Agarwal","Prafful","Manjul Chawla","Hemant Yadav","Himanshi Sharma","Vinisha Pathak","Heena Sharma","Vibhor Malik","Abhilaksh Kaushik","Rohit Yadav","Vikas Kalra","Rohit Kahlawat","Manjul Chawla","Vishal Jangra","Aman Rohilla","Lokesh Singhal","Manish Chauhan"];
    List<String>post = ["Software Developer","Software Developer","Software Developer","Software Developer","Associate Engineer","NULL","Junior Associate IT","NULL","DOTNET Developer","Digital Solutions Developer","Associate Software Developer","Application Developer","Software Developer","Junior Software Developer","Intern","Junior Software Developer","Junior Associate IT","Software Engineer","Software Developer","Software Developer","Software Engineer"];
    List<String>company = ["i2V Systems","NULL","NULL","i2V Systems","Naggaro Software","NULL","Unthinkable Solutions","NULL","Cognizant","InfoAxon Technologies","Thoughts2Binary","Polestar Solutions","VVDN Technologies","Claritus","Key Claws","Claritus","Unthinkable Solutions","NULL","i2V Systems","Thoughts2Binary","Tata Consultancy Services"];
    List<String>pics = ["A1.jpg","A2.jpg","A3.jpg","A4.jpg","A5.jpg","A6.jpg","A7.jpg","A8.jpg","A9.jpg","A10.jpg","A11.jpg","A12.jpg","A13.jpg","A14.jpg","A15.jpg","A16.jpg","A17.jpg","A18.jpg","A19.jpg","A20.jpg","A21.jpg"];
    var count = names.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text('TCS BackBone', textAlign: TextAlign.center,),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: count,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4
          ),
          itemBuilder: (BuildContext,int index){
            return GestureDetector(
              onTap: (){
                showDialog(context: context,builder: (context)=>profile(
                  name: names[index],
                  skill: post[index],
                  batch: company[index],
                  linkedinurl:'vicky-gupta-545280152',
                  pic: pics[index],
                ));
              },
              child: Container(
                padding:EdgeInsets.fromLTRB(0,20,0,0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.black,
                  shadowColor: Colors.red,
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: screenwidth*0.30,
                        height: screenheight*0.15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(pics[index],
                            fit:BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        names[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
