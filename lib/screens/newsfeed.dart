import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_project/utils/helper.dart';

class NewsFeed extends StatefulWidget {
  NewsFeed({Key key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://github.com/Abi-S';
    final Color bgColor = Color(0xffF3F3F3);
    final Color primaryColor = Color(0xffE70F0B);

    var titleTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    );
    var descriptionTextStyle = TextStyle(
      fontSize: 10.0,
      color: Colors.grey.shade800,
    );
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "News",
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: InkWell(
                  onTap: () => setState(() {
                    _launched = _launchInBrowser(toLaunch);
                  }),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              height: 120,
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              child: Text(
                                "I told Azhar that if I fail, I will never come back’: Sachin Tendulkar reveals conversation with Azharuddin... - Hindustan Times",
                                textAlign: TextAlign.justify,
                                style: titleTextStyle,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black87
                                    ],
                                    stops: [
                                      0.0,
                                      1.0
                                    ]),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/images/news.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Over the years, many former cricketers who were part of that squad have narrated the incident of what led to Tendulkar moving up the order. This time, Tendulkar himself explained what transpired after Navjot Sidhu informed the team of his stiff neck",
                              textAlign: TextAlign.justify,
                              style: descriptionTextStyle,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Yesterday, 9:24 PM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  "Yesterday, 9:24 PM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),

                      // bottomNavigationBar: BottomNavigationBar(
                      //   type: BottomNavigationBarType.fixed,
                      //   backgroundColor: bgColor,
                      //   selectedItemColor: primaryColor,
                      //   unselectedItemColor: Colors.grey.shade700,
                      //   currentIndex: 0,
                      //   elevation: 0,
                      //   items: [
                      //     BottomNavigationBarItem(
                      //       icon: Icon(Icons.access_alarm),
                      //       title: Padding(
                      //         padding: const EdgeInsets.only(top: 4.0),
                      //         child: Icon(
                      //           Icons.access_alarm,
                      //           size: 8.0,
                      //           color: primaryColor,
                      //         ),
                      //       ),
                      //     ),
                      //     BottomNavigationBarItem(
                      //       icon: Icon(Icons.access_alarm),
                      //       title: Text(""),
                      //     ),
                      //     BottomNavigationBarItem(
                      //       icon: Icon(Icons.access_alarm),
                      //       title: Text(""),
                      //     ),
                      //     BottomNavigationBarItem(
                      //       icon: Icon(Icons.access_alarm),
                      //       title: Text(""),
                      //     ),
                      //   ],
                      // ),
                    ]),
                  ),
                ),
              );
            }));
  }
}
