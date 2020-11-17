import 'package:company_profile/model/company.dart';

class RepoData {
  static final Company bawp = new Company(
    name: "Build Apps With Paulo",
    about:
        "Our goal is to teach you the skills and equip you with the tools to become best mobile developer and programmer you can be. We want to make you a well-rounded developer. That's the mission.",
    backdropPhoto: "assets/bawp_creator.png",
    courses: <Course>[
      new Course(
          title: "The Complete Android & Java Bootcamp",
          thumbnail: "assets/android_bootcamp.png",
          url: "https://www.udemy.com/complete-android-developer-course/"),
      new Course(
          title: "Kotlin Android Development Masterclass",
          thumbnail: "assets/kotlin.png",
          url: "https://www.udemy.com/kotlin-android-developer-masterclass/"),
      new Course(
          title: "Java Design Patterns",
          thumbnail: "assets/java_design-pats.png",
          url:
              "https://www.udemy.com/java-design-patterns-the-complete-masterclass/"),
      new Course(
          title: "The Java 9 Master Course",
          thumbnail: "assets/java9_course.png",
          url:
              "https://www.udemy.com/the-complete-java-9-masterclass-beginner-to-expert/"),
      new Course(
          title: "Android Developer Portfolio",
          thumbnail: "assets/android_portfolio.png",
          url:
              "https://www.udemy.com/android-developers-portfolio-masterclass-build-7-apps/")
    ],
    location: "Spokane, WA",
    logo: "assets/logo.png",
  );
}
