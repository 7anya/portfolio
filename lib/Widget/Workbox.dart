import 'package:flutter/material.dart';
import 'package:potrtfolio/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Google Summer of Code- AOSSIE",
          subTitle:
              "Selected as Google Summer of Code participant ",
          duration: "2021",
        ),
        WorkCustomData(
          title: "Red hat",
          subTitle:
              "Intern at Red Hat",
          duration: "June to August 2021",
        ),
        WorkCustomData(
          title:
              "Freelancer - Flutter | Dart Mobile App Developer | UI - UX Designer",
          subTitle:
              "Flutter Developer and experienced programmer with an extensive history of designing and coding \nsolutions. Skilled in Google’s Flutter/Dart, Firebase App and Web development on a global scale. If you \nare looking for someone that you can trust that will complete your app on time and on budget, then \nplease contact me. I have been developing software for 1+ years and take pride in everything I do.",
          duration: "Oct - 2019 to Nov - 2020",
        ),
        WorkCustomData(
          title: "Mentor at Contributor's Hack, 2020",
          subTitle:
              "Working as a mentor in HakinCode organization for Flutter CodeAsylums application \n where I can utilize my skills and be an asset to the organization",
          duration: "Sep 2020 - Oct 2020",
        ),
        WorkCustomData(
          title: "Flutter Intern at Mind Sports League | Gurgaon In",
          subTitle:
              "Building world class Poker Learning platform. Poker Sports League is India’s first poker league is to sportify the game of poker through a unique, team based format",
          duration: "Nov - 2020 Present",
        ),
      ],
    );
  }
}
