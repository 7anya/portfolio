import 'package:flutter/material.dart';
import 'package:Tanya/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Microsoft",
          subTitle:
          "Incoming Intern at Microsoft for summer 2022 ",
          duration: "2022",
        ),
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
              "National Informatics Center",
          subTitle:
              "Blockchain and stuff",
          duration: "May-june 2020",
        ),

      ],
    );
  }
}
