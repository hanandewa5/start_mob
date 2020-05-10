import 'package:flutter/material.dart';
import 'package:start_mob/viewmodels/auth_viewmodel.dart';
import 'package:start_mob/views/_helpers/color_helper.dart';
import 'package:start_mob/views/_helpers/images_helper.dart';
import 'package:start_mob/views/_helpers/size_config.dart';
import 'package:start_mob/views/_helpers/strings.dart';
import 'package:start_mob/views/_helpers/ui_helpers.dart';
import 'package:start_mob/views/_widgets/Animation/fade_animation.dart';
import 'package:start_mob/views/_widgets/Animation/rightToLeft_animation.dart';
import 'package:start_mob/views/_widgets/Layout/custom_container.dart';
import 'package:start_mob/views/_widgets/Layout/responsive_widget.dart';
import 'package:start_mob/views/_widgets/Text/Paragraft.dart';
import 'package:start_mob/views/base_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthVM>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: CustomContainer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            Content(),
          ],
        )),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
        ),
      ),
      constraints: BoxConstraints(
          maxHeight: 40 *
              (SizeConfig.isMobilePortrait
                  ? SizeConfig.heightMultiplier
                  : SizeConfig.widthMultiplier)),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ResponsiveWidget(
            portraitLayout: TopContainerPortrait(),
            landscapeLayout: TopContainerLandscape(),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        color: AppColors.appBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.0 * SizeConfig.widthMultiplier,
              vertical: 1 * SizeConfig.heightMultiplier,
            ),
            child: RightToLeftAnimation(
              delay: 1.3,
              child: Text(
                Strings.popular,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RightToLeftAnimation(
                delay: 1,
                child: Row(
                  children: <Widget>[
                    PortraitCard(
                      imagePath: Images.graphicDesigner,
                      lessonName: Strings.graphicDesigner,
                      numberOfCourses: "234",
                    ),
                    PortraitCard(
                      imagePath: Images.swimming,
                      lessonName: Strings.swimming,
                      numberOfCourses: "34",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.0 * SizeConfig.widthMultiplier,
              vertical: 1 * SizeConfig.heightMultiplier,
            ),
            child: RightToLeftAnimation(
              delay: 1.5,
              child: Text(
                Strings.joinAWorkshop,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: RightToLeftAnimation(
              delay: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    PortraitCard(
                      imagePath: Images.graphicDesigner,
                      lessonName: Strings.graphicDesigner,
                      numberOfCourses: "234",
                    ),
                    PortraitCard(
                      imagePath: Images.swimming,
                      lessonName: Strings.swimming,
                      numberOfCourses: "34",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortraitCard extends StatelessWidget {
  final String imagePath, lessonName, numberOfCourses;

  const PortraitCard(
      {Key key, this.imagePath, this.lessonName, this.numberOfCourses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.heightMultiplier),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3 * SizeConfig.heightMultiplier),
              ),
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0 * SizeConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  lessonName,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "$numberOfCourses Courses",
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.selectedTabBackgroundColor,
                borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(3.0 * SizeConfig.heightMultiplier))),
            child: Align(
              alignment: Alignment(0, SizeConfig.isMobilePortrait ? 0.3 : 0.35),
              child: Paragraft(
                Strings.lessons,
                color: AppColors.appBackgroundColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.unSelectedTabBackgroundColor,
                borderRadius: BorderRadius.vertical(
                    bottom:
                        Radius.circular(3.0 * SizeConfig.heightMultiplier))),
            child: Align(
              alignment: Alignment(0, SizeConfig.isMobilePortrait ? 0.3 : 0.35),
              child: Text(
                Strings.myClasses,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppColors.topBarBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: FadeAnimation(
                        delay: 0.5,
                        child: Row(
                          children: <Widget>[
                            ProfileImage(),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1 * SizeConfig.heightMultiplier,
                                ),
                                child: Text(
                                  Strings.greetingMessage,
                                  style: Theme.of(context).textTheme.display1,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.blur_on,
                              size: 8 * SizeConfig.imageSizeMultiplier,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FadeAnimation(
                        delay: 1,
                        child: Center(
                          child: Text(
                            Strings.whatLearnToday,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RightToLeftAnimation(
              delay: 1,
              child: Container(
                padding: EdgeInsets.only(
                  left: 2 * SizeConfig.heightMultiplier,
                  bottom: 2.5 * SizeConfig.heightMultiplier,
                ),
                height: 17 * SizeConfig.heightMultiplier,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                maxRadius: 5 * SizeConfig.heightMultiplier,
                                child: CircleAvatar(
                                  maxRadius: 4.5 * SizeConfig.heightMultiplier,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(Images.peson),
                                ),
                              ),
                              UIHelper.verticalSpace(0.5),
                              Paragraft("Data Pribadi")
                            ],
                          ),
                          UIHelper.horizontalSpace(3.4),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopContainerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppColors.topBarBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.0 * SizeConfig.heightMultiplier,
                  right: 2.0 * SizeConfig.heightMultiplier,
                  top: 1.0 * SizeConfig.heightMultiplier,
                ),
                child: Row(
                  children: <Widget>[
                    ProfileImage(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.greetingMessage,
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2 * SizeConfig.heightMultiplier),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              size: 3 * SizeConfig.heightMultiplier,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1 * SizeConfig.heightMultiplier,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.searchHere,
                                  ),
                                  style: Theme.of(context).textTheme.display2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.blur_on,
                      size: 8 * SizeConfig.imageSizeMultiplier,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 2.0 * SizeConfig.heightMultiplier,
                    bottom: 1.5 * SizeConfig.heightMultiplier),
                child: Row(
                  children: <Widget>[
                    Text(
                      Strings.whatLearnToday,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Spacer(),
                    Container(
                      width: 10 * SizeConfig.heightMultiplier,
                      padding: EdgeInsets.symmetric(
                          vertical: 1 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              3.0 * SizeConfig.heightMultiplier),
                          bottomLeft: Radius.circular(
                              3.0 * SizeConfig.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.pinkAccent.withOpacity(0.4),
      ),
      child: Image.asset(
        Images.profileImage,
        width: 10 * SizeConfig.imageSizeMultiplier,
        height: 10 * SizeConfig.imageSizeMultiplier,
      ),
    );
  }
}
