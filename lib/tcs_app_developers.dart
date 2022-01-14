import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'customColors.dart';
import 'package:tcsflutter_app/home/home_screen.dart';

class TcsDevelopers extends StatelessWidget {

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could Not Launch $url';
    }
  }

  List<String>developer_images = [
    // "https://drive.google.com/uc?export=view&id=145_-Ynrr03L9EFVqz7jq4BcOnVEvtqTf",
    "M_Abhilaksh.jpg",
    "M2.jpg",
    "M24.jpg",
    "M28.jpg",
    "M22.jpg",
    "M12.jpg",
    'M20.jpg'];
  List<String>developer_names = ["Abhilaksh Kaushik","Pooja Pilani","Aman Singh","Sofia","Saksham","Ansh Agrawal",'Ruchi'];
  List<String>developer_descriptions = ["Team Lead and Lead Developer","Lead Developer","Developer","Developer","Developer","Lead Developer",'Lead Developer'];
  List<String>developer_linkedin_urls = ['Null','Null',"https://www.linkedin.com/in/aman-singh-8a5892191/","https://www.linkedin.com/in/sofia-arora-120279198","https://www.linkedin.com/in/saksham-nagpal-b77467196","https://www.linkedin.com/in/ansh-agrawal-03480b202","https://www.linkedin.com/in/ruchi-chawla-4978911a1"];
  var total_developers = 7;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          // backgroundColor: Colors.grey[850],
          backgroundColor: Colors.black,
          title: Text("Developers"),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () =>  Navigator.pop(context),
          ),
        ),
        body: Center(
          child:CarouselSlider.builder(
            itemCount: total_developers,
            itemBuilder: (context, index, realIDX){
              return  Card(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((20)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      child: Center(
                        child: Image.asset(developer_images[index]),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(developer_names[index]),
                    SizedBox(
                      height: 30,
                    ),
                    Text(developer_descriptions[index]),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          var url = developer_linkedin_urls[index];
                          launchURL(url);

                        }, child: Text('View Profile',))
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 20.0,
              enlargeCenterPage: true,
              height: 600,
              viewportFraction: 0.78,
              autoPlayAnimationDuration: Duration(seconds: 2),
              pauseAutoPlayOnTouch: true,
            ),
          ),

        ),
      ),
    );
  }
}