import 'package:flutter/material.dart';
import 'package:mySite/Widget/CustomText.dart';
import 'package:mySite/staticData.dart';

class About extends StatelessWidget {
  final descriptionStyle = TextStyle(
      fontSize: 17, color: Color(0xff828DAA), letterSpacing: 0.75, height: 1.5);

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 20.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: descriptionStyle,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "01.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CustomText(
                      text: "About Me",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      // Space before thin grey line
                      width: size.width * 0.01,
                    ),
                    Container(
                      // Thin grey line
                      width: size.width / 4,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                //About me description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi! I am " + Strings.firstName,
                        style: descriptionStyle),
                    Text(Strings.myLongDescription, style: descriptionStyle),
                    Text("I am skilled at: \n", style: descriptionStyle),
                  ],
                ),

                // Container(
                //   height: size.height * 0.15,
                //   width: size.width,
                Wrap(
                  children: [
                    Container(
                      width: size.width * 0.20,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          for (var skill in Lists.mySkillsLeft)
                            Column(children: [
                              technology(context, skill),
                              SizedBox(
                                height: 5,
                              )
                            ])
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          for (var skill in Lists.mySkillsRight)
                            Column(children: [
                              technology(context, skill),
                              SizedBox(
                                height: 5,
                              )
                            ])
                        ],
                      ),
                    )
                  ],
                ),
                // )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: Color(0xff61F9D5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: Color(0xff0A192F),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width / 5,
                    color: Colors.black54,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("images/profilePic.jpeg"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
