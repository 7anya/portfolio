import 'package:flutter/material.dart';
import 'package:mySite/Widget/work_custom_data.dart';
import 'package:mySite/staticData.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var workExperience in Lists.workExperience)
          WorkCustomData(
            title: workExperience.company,
            subTitle: workExperience.description,
          )
      ],
    );
  }
}
