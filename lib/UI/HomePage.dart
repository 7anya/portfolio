import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:mySite/Model/Method.dart';
import 'package:mySite/UI/About.dart';
import 'package:mySite/UI/Work.dart';
import 'package:mySite/Widget/AppBarTitle.dart';
import 'package:mySite/Widget/CustomText.dart';
import 'package:mySite/Widget/MainTiitle.dart';
import 'package:mySite/staticData.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
    final response = await http.get(Uri.parse(Strings.fetchBlogsUrl));
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
                                Method.launchURL(Strings.resumeUrl);
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
                        for (var link in Lists.links)
                          IconButton(
                              icon: link.icon,
                              color: Color(0xffffA8B2D1),
                              iconSize: 16.0,
                              onPressed: () {
                                Method.launchURL(link.link);
                              }),

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
                              Method.launchEmail();
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
                                    text: "Hi! I am",
                                    textsize: 20.0,
                                    color: Color(0xff41FBDA),
                                    letterSpacing: 3.0,
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  CustomText(
                                    text: Strings.fullName + ".",
                                    textsize: 68.0,
                                    color: Color(0xffCCD6F6),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  CustomText(
                                    text: Strings.myTagline,
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
                                        Strings.myShortDescription,
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
                                      Method.launchEmail();
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
                                height: size.height * 0.02,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    children: [
                                      MainTitle(
                                        number: "0.3",
                                        text: "Some Things I've Built",
                                      ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      for (var featureProject
                                          in Lists.featureProjects)
                                        featureProject,
                                    ],
                                  )),

                              SizedBox(
                                height: 6.0,
                              ),
                              _wrapScrollTag(
                                  index: 3,
                                  child: Column(
                                    children: [
                                      MainTitle(
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
                                            for (var researchInterest
                                                in Lists.researchInterests)
                                              Column(
                                                children: [
                                                  CustomText(
                                                    text: researchInterest,
                                                    textsize: 16.0,
                                                    color: Colors.white
                                                        .withOpacity(0.4),
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1.75,
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.04,
                                                  )
                                                ],
                                              )
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
                                      MainTitle(
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
                                              text: Strings.blogDescription,
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
                                                              Method.launchURL(
                                                                  blogList[
                                                                          index]
                                                                      .url)),
                                                      // SizedBox(height:20),
                                                      // Image.network("https://lh3.googleusercontent.com/-AwkRDDgxgRQ/YNdjCcF0nyI/AAAAAAAAb3M/Ac7SmJR3mJ07tYTtGhYuFiwHc7PEJknKgCNcBGAsYHQ/w945-h600-p-k-no-nu/image.png"),
                                                      SizedBox(height: 40),
                                                    ],
                                                  ));
                                                })
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
                                      MainTitle(
                                        number: "0.6",
                                        text: "Co-curriculars",
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
                                            for (var coCurricular
                                                in Lists.coCurriculars)
                                              Container(
                                                  child: Column(children: [
                                                CustomText(
                                                  text: coCurricular,
                                                  textsize: 16.0,
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.75,
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.04,
                                                )
                                              ]))
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
                                              Method.launchEmail();
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
                                      child: Column(children: [
                                        Text(
                                          "End",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            letterSpacing: 1.75,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                            "Original Design by Brittany Chiang (https://brittanychiang.com/)",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              letterSpacing: 1.75,
                                              fontSize: 14.0,
                                            )),
                                      ]),
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
                            Strings.emailId,
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
