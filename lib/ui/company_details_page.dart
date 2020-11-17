import 'package:company_profile/model/company.dart';
import 'package:company_profile/ui/course_card.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'company_details_intro_animation.dart';
import 'dart:ui' as ui;

class CompanyDetailsPage extends StatelessWidget {
  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  final Company company;
  final CompanyDetailsIntroAnimation animation;

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation.bgdropBlur.value,
              sigmaY: animation.bgdropBlur.value),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AnimatedBuilder(
          animation: animation.controller, builder: _createAnimation),
    );
  }

  Widget _createContent() {
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _createLogoAvatar(),
          _createAboutCompany(),
          _createCourseScroller()
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: new Container(
        width: double.infinity,
        height: 110.0,
        margin: const EdgeInsets.only(top: 32.0, left: 19.0),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: new Image.asset(
                company.logo,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Build Apps with Paulo",
                style: TextStyle(
                    fontSize: 19 * animation.avatarSize.value + 2.0,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutCompany() {
    return new Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            company.name,
            style: new TextStyle(
                color: Colors.white.withOpacity(animation.nameOpacity.value),
                fontSize: 30.0 * animation.avatarSize.value + 2.0,
                fontWeight: FontWeight.bold),
          ),
          new Text(
            company.location,
            style: new TextStyle(
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
                fontWeight: FontWeight.w500),
          ),
          //Line/Divider
          new Container(
            color: Colors.white.withOpacity(0.79),
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          new Text(
            company.about,
            style: new TextStyle(
                color: Colors.white.withOpacity(animation.aboutOpacity.value),
                height: 1.4),
          )
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return new Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: new Matrix4.translationValues(
            animation.courseScrollXTranslation.value, 0.0, 0.0),
        child: new SizedBox.fromSize(
          size: new Size.fromHeight(250.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: company.courses.length,
              itemBuilder: (BuildContext context, int index) {
                var course = company.courses[index];
                return new CourseCard(course);
              }),
        ),
      ),
    );
  }
}
