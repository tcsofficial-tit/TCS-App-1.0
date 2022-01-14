import 'package:flutter/material.dart';
import 'ListClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hexcolor/hexcolor.dart';

class PlacementPage extends StatefulWidget {
  PlacementPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PlacementPage> {

  _launchURL(String $url_id) async {
    var url = $url_id;
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: HexColor('#282c35'),
        appBar: AppBar(
          backgroundColor: HexColor('#0f0f0f'),
          title: Text('Company Placements'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: company.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _launchURL(company[index].url);
                },
                child: Container(
                  color:  Colors.grey[900],
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 4.0),
                  margin: EdgeInsets.all(8),
                  width: size.width,
                  height: size.height / 4,
                  child: Row(
                      children:[
                        Container(
                          padding: EdgeInsets.all(12),
                          width:(size.width*0.4),
                          height: (size.width*0.4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/${company[index].image}',
                                fit:BoxFit.fill
                            ),
                          ),
                        ),
                        Expanded(child: Text(company[index].text,style: TextStyle(color: Colors.white),)),
                      ]
                  ),
                ),
              );
            })
    );
  }
}















//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// ListClass.dart




class ListClass {
  String text;
  String image;
  String url;
  ListClass({this.text,this.image,this.url});
}

List<ListClass> company = [
  ListClass(
    text:
    'Daffodil Software is a software engineering partner to 100+ organizations across the globe and has been helping them in making their software products more robust, teams more productive and processes more efficient.',
    image: 'daffodilsw.png',url: 'https://www.daffodilsw.com/',),
  ListClass(
      text:
      "Nagarro-Software, is an industry related to business consultation and software development. Founded in 1996, it is headquartered in Munich, Germany and it has its main development office is in Gurgaon, India.",
      image: 'naggaro.png',url: 'https://www.nagarro.com/en'),
  ListClass(
      text:
      "Established in 1981, Infosys is a NYSE listed global consulting and IT services company with more than 250k employees. Now, Infosys is a global leader in next-generation digital services and consulting.",
      image: 'infosys.png',url: 'https://www.infosys.com/'),
  ListClass(
      text:
      "Sapient, an active element of Publicis. Sapient, is a global services company that helps clients transform in the areas of business, marketing, and technology. The company operates three divisions that enable clients to gain a competitive advantage and succeed in an increasingly digital world.",
      image: 'sapient.png',url: 'https://www.publicissapient.com/'),
  ListClass(
      text:
      "Tata Consultancy Services (TCS) is an Indian multinational information technology (IT) services and consulting company, headquartered in Mumbai, Maharashtra, India and largest campus and workforce in Chennai, Tamil Nadu, India. TCS is the second largest Indian company by market capitalisation.",
      image: 'tcs.png',url: 'https://www.tcs.com/'),
  ListClass(
      text:
      "Cognizant is an American multinational technology company that provides business consulting, information technology and outsourcing services. It is headquartered in Teaneck, New Jersey, United States. Cognizant is part of the NASDAQ-100 and trades under CTSH.",
      image: 'cognizant.png',url: 'https://www.cognizant.com/'),
  ListClass(
      text:
      "Newgen is a leading provider of low code digital automation platform. Newgen's cloud-based platform enables digital transformation initiatives for superior customer experience, optimized costs, and improved efficiencies. Newgen Software is certified for ISO 9001:2015 and ISO 27001:2013.",
      image: 'newgen.png',url: 'https://newgensoft.com/'),
  ListClass(
      text:
      "VVDN - an acronym for Voice, Video, Data, Network, has more than a decade of experience in Product Engineering & Manufacturing electronic solutions. We help customers steer their next-generation solutions with end-to-end design, development, and manufacturing – all under one.",
      image: 'vvdn.png',url: 'https://www.vvdntech.com/'),
  ListClass(
      text:
      "Claritus, Inc. has been providing clients with clear solutions for over 30-years. We've grown to become one of the largest independent mailing equipment dealerships within the United States. The world is changing rapidly and the mailing industry is no exception.",
      image: 'claritus.png',url: 'https://www.claritusconsulting.com/'),
];