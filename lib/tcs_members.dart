import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class TcsMembers extends StatefulWidget {
  TcsMembers({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TcsMembers> {

  @override
  Widget build(BuildContext context) {

    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    List<String>linkedinurl = ["NULL","NULL","NULL","NULL","NULL","NULL","NULL","https://www.linkedin.com/in/nilansh-verma",
        "https://www.linkedin.com/in/ankur-gupta-845743172","https://www.linkedin.com/in/vansh-tayal-851310209",
      "https://www.linkedin.com/in/raghu-pratap-singh-9565701a1","https://www.linkedin.com/in/ansh-agrawal-03480b202",
      "https://www.linkedin.com/in/aaryansharma1702","https://www.linkedin.com/in/barbiemakkar",
      "https://www.linkedin.com/in/tanya-munjal-710b381b2","https://www.linkedin.com/in/vibhor-sharma-08b0321b1",
      "https://www.linkedin.com/in/ruchi-chawla-4978911a1","https://www.linkedin.com/in/deepanshu-bansal-853bb9201",
      "https://www.linkedin.com/in/saksham-nagpal-b77467196","https://www.linkedin.com/in/vivansingh-mandeep","https://www.linkedin.com/in/aman-singh-8a5892191/",
      "https://www.linkedin.com/in/sakshi-rajput-ab054b1a1","https://www.linkedin.com/in/purvi-munjal-8890a31b3","https://www.linkedin.com/in/tamanna-garg-296679211",
      "https://www.linkedin.com/in/sofia-arora-120279198","NULL","www.linkedin.com/in/muskan-asija-9227131a1","https://www.linkedin.com/in/lohit-jindal-59b5401a1",
      "https://www.linkedin.com/in/bharat-sharma-9108371b6","https://www.linkedin.com/in/sakshi-kaushik-01a06b1a8","https://www.linkedin.com/in/madhur-verma-952a80211",
      "https://www.linkedin.com/in/apsara-raheja-b77b41199","https://www.linkedin.com/in/anuj-sharma-4b27381bb","https://www.linkedin.com/in/punnay-mittal-333789191",
      "https://www.linkedin.com/in/chhavi-sharma-a60b1b200","https://www.linkedin.com/in/mansi-sharma-5b30471b4","https://www.linkedin.com/in/ruchi-kumari-106a7b211",
      "https://www.linkedin.com/in/nancy-singh-7b630a209","https://www.linkedin.com/in/sumit-manderna-33b6a4211","https://www.linkedin.com/in/vishal-soni-669aa6211",
      "https://www.linkedin.com/in/vipul-sharma-7ab52a205","https://www.linkedin.com/in/pallavi-sharma-36baaa211","https://www.linkedin.com/in/rimpy-mittal-a03a15204",
      "https://www.linkedin.com/in/vanshika-kakkar-052a84211","https://www.linkedin.com/in/lavish-dudi-022a7a211","NULL","https://www.linkedin.com/in/ishita-kaushik-168aa9211",
      "www.linkedin.com/in/divyachandna22","https://www.linkedin.com/in/charanjeet-kaur-5614961b9",
        "https://www.linkedin.com/in/praduman-tanwar-207aa9211","https://www.linkedin.com/in/shivam-sharma-aaaab2211","https://www.linkedin.com/in/usha-sharma-170ab2211",
      "https://www.linkedin.com/in/mahima-bhardwaj-448677211","https://www.linkedin.com/in/karishma-bansal-818683211"];
    List<String>names = ["Viswajit Mann","Pooja Pilani","Jatin","Vicky Gupta","Muskan","Naman Jain","Sandeep","Neelansh","Ankur Gupta","Vansh Tayal","Raghu Pratap","Ansh Agrawal","Aaryan Sharma","Barbie","Tanya Munjal","Vibhor","Ruchi Chawla","Deepanshu","Saksham","Vivan Singh","Aman Singh","Sakshi Rajput","Purvi Munjal","Tamanna","Sofia Arora","Kavita","Muskan Asija","Lohit Jindal","Bharat Sharma","Sakshi Kaushik","Madhur Verma","Apsara Raheja","Anuj Sharma","Punnay Mittal","Chhavi Sharma","Mansi Sharma","Ruchi Choudhary","Nancy Singh","Sumit Manderna","Vishal Soni","Vipul Sharma","Pallavi Sharma","Rimpy Mittal","Vanshika Kakkar","Lavish","Pallavi Sharma","Ishita Kaushik","Divya Chandna","Gurman Kaur","Praduman Tanwar","Shivam Sharma","Usha Sharma","Mahima Bhardwaj","Karishma Bansal"];
    List<String>skills = ["React Native","Java, Web Development","Logic Building","OOPS, AWS Cloud","Java, Python","Backend Development","C++, Java, Python","Cyber Security","Java Developer","C, C++","Artificial Intelligence","C++, Java, Android","Java, Operating System","C, C++","C, Multimedia","C++, Python","C++, Android","C++","C, C++","C++, Python","Java, Android","C++","Multimedia","C, Multimedia","C++, Android","C Language","C++, Python","Ethical Hacking","Web Developer","C, C++","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python","C, C++","Multimedia","Python"];
    List<String>batches = ["2017","2017","2017","2017","2017","2017","2017","2018","2018","2018","2018","2018","2018","2018","2018","2018","2018","2019","2019","2019","2019","2019","2019","2019","2019","2019","2019","2019","2019","2019","2019","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020","2020"];
    List<String>pics = ["M1.jpg","M2.jpg","M3.jpg","M4.jpg","M5.jpg","M6.jpg","M7.jpg","M8.jpg","M9.jpg","M10.jpg","M11.jpg","M12.jpg","M13.jpg","M14.jpg","M15.jpg","M17.jpg","M20.jpg","M21.jpg","M22.jpg","M23.jpg","M56.jpg","M25.jpg","M26.jpg","M27.jpg","M28.jpg","M29.jpg","M30.jpg","M47.jpg","M62.jpg","M33.jpg","M34.jpg","M35.jpg","M36.jpg","M37.jpg","M39.jpg","M42.jpg","M43.jpg","M44.jpg","M45.jpg","M46.jpg","M48.jpg","M49.jpg","M50.jpg","M51.jpg","M52.jpg","M53.jpg","M54.jpg","M57.jpg","M58.jpg","M60.jpg","M61.jpg","M63.jpg","M64.jpg","M65.jpg"]; //,"C, C++","Multimedia","Python"
    var count = names.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: Text('TCS Members', textAlign: TextAlign.center,),
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
                  skill: skills[index],
                  batch: batches[index],
                  linkedinurl:linkedinurl[index],
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