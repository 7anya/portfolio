import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Tanya/Model/Method.dart';
import 'package:Tanya/UI/About.dart';
import 'package:Tanya/UI/FeatureProject.dart';
import 'package:Tanya/UI/Work.dart';
import 'package:Tanya/Widget/AppBarTitle.dart';
import 'package:Tanya/Widget/CustomText.dart';
import 'package:Tanya/Widget/MainTiitle.dart';
import 'package:Tanya/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Blog {
  String name;
  String url;

  Blog(this.name, this.url);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;
  List<Blog> blogList = [];
  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
    fetchBlogs().then((value) => null);
  }

  Future<bool> fetchBlogs() async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/blogger/v3/blogs/5624676173177206066/posts?key=AIzaSyBL2PBVyJeCaBxXkBdW-T_CMOJ7IrJCWW4'));
    var temp = jsonDecode(response.body);
    List<dynamic> blogs = temp["items"];
    // Use the compute function to run parsePhotos in a separate isolate.
    for (var i = 0; i < blogs.length; i++) {
      print("#71 " + blogs[i]["url"] + " " + blogs[i]["title"]);
      // blogList.add(Blog("hi","hi"))//;

      blogList.add(Blog(blogs[i]["title"], blogs[i]["url"]));
    }
    return true;
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0A192F),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.change_history,
                            size: 32.0,
                            color: Color(0xff64FFDA),
                          ),
                          onPressed: () {}),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 7,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'About',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Experience',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Builds',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Research',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Blog',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Fun',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Contact',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Card(
                          elevation: 4.0,
                          color: Color(0xff64FFDA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(0.85),
                            height: size.height * 0.07,
                            width: size.height * 0.20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff0A192F),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: FlatButton(
                              hoverColor: Color(0xFF3E0449),
                              onPressed: () {
                                method.launchURL(
                                    "https://drive.google.com/file/d/19GflHg7LlYQjfNA2lYc5lwAVegAJJ5-q/view?usp=sharing");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  "Resume",
                                  style: TextStyle(
                                    color: Color(0xff64FFDA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  Container(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.github),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL("https://github.com/7anya");
                            }),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.blogger),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchURL(
                                  "https://one-to-tan.blogspot.com/");
                            }),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin),
                          color: Color(0xffffA8B2D1),
                          onPressed: () {
                            method.launchURL(
                                "https://www.linkedin.com/in/tanya-prasad/");
                          },
                          iconSize: 16.0,
                        ),
                        // IconButton(
                        //     icon: Icon(Icons.call),
                        //     color: Color(0xffffA8B2D1),
                        //     iconSize: 16.0,
                        //     onPressed: null,),
                        IconButton(
                            icon: Icon(Icons.mail),
                            color: Color(0xffffA8B2D1),
                            iconSize: 16.0,
                            onPressed: () {
                              method.launchEmail();
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: size.height * 0.20,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * .06,
                                  ),
                                  CustomText(
                                    text: "Hi, my name is",
                                    textsize: 16.0,
                                    color: Color(0xff41FBDA),
                                    letterSpacing: 3.0,
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  CustomText(
                                    text: "Tanya Prasad.",
                                    textsize: 68.0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  CustomText(
                                    text: "Learn. Create. Repeat. ",
                                    textsize: 56.0,
                                    color: Color(0xffCCD6F6).withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    height: size.height * .04,
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        "I am a Computer Science Undergrad at BITS Pilani, Hyderabad, graduating in 2023",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          letterSpacing: 2.75,
                                          wordSpacing: 0.75,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * .12,
                                  ),

                                  //get in tuch text
                                  InkWell(
                                    onTap: () {
                                      method.launchEmail();
                                    },
                                    hoverColor:
                                        Color(0xff64FFDA).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.09,
                                      width: size.width * 0.14,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xff64FFDA),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        "Get In Touch",
                                        style: TextStyle(
                                          color: Color(0xff64FFDA),
                                          letterSpacing: 2.75,
                                          wordSpacing: 1.0,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: size.height * 0.20,
                                  ),
                                ],
                              ),

                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: Work()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        imagePath: "/images/psiseasy.png",
                                        ontab: () {
                                          method.launchURL(
                                              "https://psitseasy.ml");
                                        },
                                        projectDesc:
                                            "All round assist portal for Practice School Allotment",
                                        projectTitle: "PS.Its-Easy",
                                        tech1: "Flask",
                                        tech2: "React",
                                        tech3: "MongoDB",
                                      ),

                                      //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic114.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic115.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic116.jfif",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic117.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       // Row(
                                      //       //   mainAxisAlignment:
                                      //       //       MainAxisAlignment.spaceAround,
                                      //       //   children: [
                                      //       //     CustomText(
                                      //       //       text: "Spannish Audio",
                                      //       //       textsize: 16.0,
                                      //       //       color: Colors.white
                                      //       //           .withOpacity(0.4),
                                      //       //       fontWeight: FontWeight.w700,
                                      //       //       letterSpacing: 1.75,
                                      //       //     ),
                                      //       //     CustomText(
                                      //       //       text: "Drumpad",
                                      //       //       textsize: 16.0,
                                      //       //       color: Colors.white
                                      //       //           .withOpacity(0.4),
                                      //       //       fontWeight: FontWeight.w700,
                                      //       //       letterSpacing: 1.75,
                                      //       //     ),
                                      //       //     CustomText(
                                      //       //       text: "Currency Converter",
                                      //       //       textsize: 16.0,
                                      //       //       color: Colors.white
                                      //       //           .withOpacity(0.4),
                                      //       //       fontWeight: FontWeight.w700,
                                      //       //       letterSpacing: 1.75,
                                      //       //     ),
                                      //       //     CustomText(
                                      //       //       text: "Calculator",
                                      //       //       textsize: 16.0,
                                      //       //       color: Colors.white
                                      //       //           .withOpacity(0.4),
                                      //       //       fontWeight: FontWeight.w700,
                                      //       //       letterSpacing: 1.75,
                                      //       //     ),
                                      //       //   ],
                                      //       // ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // //other Projects
                                      // Container(
                                      //   height: size.height * 0.86,
                                      //   width: size.width - 100,
                                      //   child: Column(
                                      //     children: [
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           OSImages(
                                      //             image: "images/pic118.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic119.jpeg",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic120.png",
                                      //           ),
                                      //           OSImages(
                                      //             image: "images/pic121.png",
                                      //           ),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: size.height * 0.04,
                                      //       ),
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceAround,
                                      //         children: [
                                      //           CustomText(
                                      //             text: "Prime Videos UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Tic Tac Toe Game",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Currency Converter UI",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //           CustomText(
                                      //             text: "Love Calculator",
                                      //             textsize: 16.0,
                                      //             color: Colors.white
                                      //                 .withOpacity(0.4),
                                      //             fontWeight: FontWeight.w700,
                                      //             letterSpacing: 1.75,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic104.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-UI-Kit");
                                      //   },
                                      //   projectDesc:
                                      //       "A nicer look at your GitHub profile and repo stats. Includes data visualizations of your top languages, starred repositories, and sort through your top repos by number of stars, forks, and size.",
                                      //   projectTitle: "Sign Up and Sign In",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),
                                    ],
                                  )),

                              SizedBox(
                                height: 6.0,
                              ),
                              _wrapScrollTag(
                                  index: 3,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.4",
                                        text: "Research Interests",
                                      ),

                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),

                                      //other Projects
                                      Container(
                                        height: size.height * 0.86,
                                        width: size.width - 100,
                                        child: Column(
                                          children: [
                                            CustomText(
                                              text:
                                                  "I am exploring research in the field of computer systems\n Currently working on designing advanced schedulers for MPQUIC protocol using a cross layer approach\n",
                                              textsize: 16.0,
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.75,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceAround,
                                            //   children: [
                                            //     CustomText(
                                            //       text: "Payment Getway",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Chat App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Spotify Clone",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "TODO App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 6.0,
                              ),
                              _wrapScrollTag(
                                  index: 4,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.5",
                                        text: "Blog",
                                      ),

                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),

                                      //other Projects
                                      Container(
                                        // height: size.height * 0.86,
                                        width: size.width - 100,
                                        child: Column(
                                          children: [
                                            CustomText(
                                              text:
                                                  "I have a blog where I write about interesting tech related things\nYou can find it on https://one-to-tan@blogspot.com\nor click the links below",
                                              textsize: 16.0,
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.75,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                itemCount: blogList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return new Container(
                                                      // color: Colors.amber,

                                                      child: Column(
                                                    children: [
                                                      new InkWell(
                                                          child: CustomText(
                                                            text: "> " +
                                                                blogList[index]
                                                                    .name,
                                                            textsize: 16.0,
                                                            color: Colors.red
                                                                .withOpacity(
                                                                    0.8),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: 1.75,
                                                          ),

                                                          onTap: () =>
                                                              method.launchURL(
                                                                  blogList[
                                                                          index]
                                                                      .url)),
                                                      // SizedBox(height:20),
                                                      // Image.network("https://lh3.googleusercontent.com/-AwkRDDgxgRQ/YNdjCcF0nyI/AAAAAAAAb3M/Ac7SmJR3mJ07tYTtGhYuFiwHc7PEJknKgCNcBGAsYHQ/w945-h600-p-k-no-nu/image.png"),
                                                      SizedBox(height:40),
                                                    ],
                                                  ));
                                                })
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceAround,
                                            //   children: [
                                            //     CustomText(
                                            //       text: "Payment Getway",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Chat App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Spotify Clone",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "TODO App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 6.0,
                              ),
                              _wrapScrollTag(
                                  index: 5,
                                  child: Column(
                                    children: [
                                      MainTiitle(
                                        number: "0.5",
                                        text: "Fun",
                                      ),

                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),

                                      //other Projects
                                      Container(
                                        height: size.height * 0.86,
                                        width: size.width - 100,
                                        child: Column(
                                          children: [
                                            CustomText(
                                              text:
                                                  "I play Tennis and Ultimate Frisbee :)",
                                              textsize: 16.0,
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.75,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.04,
                                            ),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.spaceAround,
                                            //   children: [
                                            //     CustomText(
                                            //       text: "Payment Getway",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Chat App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "Spotify Clone",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //     CustomText(
                                            //       text: "TODO App",
                                            //       textsize: 16.0,
                                            //       color: Colors.white
                                            //           .withOpacity(0.4),
                                            //       fontWeight: FontWeight.w700,
                                            //       letterSpacing: 1.75,
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              //Get In Touch
                              _wrapScrollTag(
                                index: 6,
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: "0.5 What's Next?",
                                            textsize: 16.0,
                                            color: Color(0xff41FBDA),
                                            letterSpacing: 3.0,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          CustomText(
                                            text: "Get In Touch",
                                            textsize: 42.0,
                                            color: Colors.white,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "Always looking to connect with interesting people!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 32.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              method.launchEmail();
                                            },
                                            child: Card(
                                              elevation: 4.0,
                                              color: Color(0xff64FFDA),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.all(0.85),
                                                height: size.height * 0.09,
                                                width: size.width * 0.10,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff0A192F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                                  child: Text(
                                                    "Say Hello",
                                                    style: TextStyle(
                                                      color: Color(0xff64FFDA),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Text(
                                        "End",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          letterSpacing: 1.75,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: MediaQuery.of(context).size.height - 82,
                    //color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: 45,
                          child: Text(
                            "tanya.prasad@gmail.com",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            height: 100,
                            width: 2,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
