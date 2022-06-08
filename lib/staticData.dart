import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mySite/UI/FeatureProject.dart';

import 'Model/Method.dart';

class Strings {
  // My details
  static const String firstName = "Rut";
  static const String middleName = "";
  static const String lastName = "Vora";
  static const String fullName =
      firstName + " " + (middleName == "" ? "" : middleName + " ") + lastName;
  static const String emailId = "contactme@rutvora.com";
  static const String telephone = "+919999999999";
  static const String resumeUrl = "<Resume URL>";

  // First section
  static const String myTagline = "myTagLine";
  static const String myShortDescription = "My Short Description";

  // About Me
  static const String myLongDescription = """
I'm a pre-final year student at BITS Pilani, India studying Computer Science and Physics.
I like to work in the field  of computer systems; Focussing on Cloud and Distributed Computing.
""";

  // Blog
  static const String blogDescription = "Blog Description";

  // TODO: Replace the key with your id and key
  static const String fetchBlogsUrl =
      'https://www.googleapis.com/blogger/v3/blogs/<id>/posts?key=<key>';
}

class Lists {
  // Links (on the left side of the page)
  static final List<Link> links = [
    Link(icon: FaIcon(FontAwesomeIcons.github), link: "<Github>"),
    Link(icon: FaIcon(FontAwesomeIcons.blogger), link: "<Blog>"),
    Link(icon: FaIcon(FontAwesomeIcons.linkedin), link: "<Linkedin>"),
  ];

  //About Me
  static const List<String> mySkillsLeft = ["eBPF", "P4"];
  static const List<String> mySkillsRight = ["Go", "Dart/Flutter"];

  //Work Experience
  static final List<WorkExperience> workExperience = [
    WorkExperience(
        icon: FaIcon(
          FontAwesomeIcons.microsoft,
          color: Colors.white,
        ),
        iconBackground: Colors.pink,
        company: "Microsoft",
        description: "Incoming intern at Microsoft for Summer 2022",
        date: "2022")
    //workExperience2, workExperience3 etc.
  ];

  // Featured Projects
  static final List<FeatureProject> featureProjects = [
    FeatureProject(
      imagePath: "<image path (relative to assets folder>",
      ontap: () {
        Method.launchURL("<url>");
      },
      projectDesc: "<Description>",
      projectTitle: "Title",
      techStack: ["Flask", "React", "MongoDB"],
    )
  ];

  // Research Interests
  static const List<String> researchInterests = [
    "Research Interest 1",
    "Research Interest 2"
  ];

  // Co-curriculars
  static const List<String> coCurriculars = [
    "Ultimate Frisbee",
    "Football (not the American one you play with hand for most of the game)"
  ];
}

// Supporting Classes
class WorkExperience {
  Widget icon;
  Color iconBackground;
  String company;
  String description;
  String date;

  WorkExperience(
      {@required this.icon,
      @required this.iconBackground,
      @required this.company,
      @required this.description,
      @required this.date});
}

class Link {
  Widget icon;
  String link;

  Link({@required this.icon, @required this.link});
}
