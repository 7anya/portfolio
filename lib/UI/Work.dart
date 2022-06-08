import 'package:flutter/material.dart';
import 'package:mySite/Widget/CustomText.dart';
import 'package:mySite/Widget/Workbox.dart';
import 'package:mySite/staticData.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height * 1.4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "02.",
                textsize: 20.0,
                color: Color(0xff61F9D5),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: 12.0,
              ),
              CustomText(
                text: "Work Experience",
                textsize: 26.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width / 4,
                height: 1.10,
                color: Color(0xff303C55),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          // Elements that contain the Work Experience
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: size.height * 0.3 * Lists.workExperience.length,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var workExperience in Lists.workExperience)
                          Text(
                            workExperience.date,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xffCCD6F6).withOpacity(0.5),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Container(
                    height: size.height * 0.3 * Lists.workExperience.length,
                    //color: Colors.indigo,
                    child: Stack(
                      children: [
                        Center(
                          child: VerticalDivider(
                            color: Color(0xff64FFDA),
                            thickness: 1.75,
                            width: 10,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Container(
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (var workExperience in Lists.workExperience)
                                CircleAvatar(
                                  backgroundColor:
                                      workExperience.iconBackground,
                                  child: workExperience.icon,
                                )
                            ],
                          )),
                        )
                      ],
                    )),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    height: size.height * 0.3 * Lists.workExperience.length,
                    child: WorkBox(),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
