import 'package:flutter/material.dart';
import 'package:start_mob/viewmodels/auth_viewmodel.dart';
import 'package:start_mob/views/_helpers/color_helper.dart';
import 'package:start_mob/views/_helpers/size_config.dart';
import 'package:start_mob/views/_widgets/Animation/fade_animation.dart';
import 'package:start_mob/views/_widgets/Clipper/wave_clipper.dart';
import 'package:start_mob/views/_widgets/Input/input_text.dart';
import 'package:start_mob/views/_widgets/Layout/custom_container.dart';
import 'package:start_mob/views/_widgets/Layout/responsive_widget.dart';
import 'package:start_mob/views/_widgets/Text/Paragraft.dart';
import 'package:start_mob/views/base_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthVM>(
      statusBarColor: Colors.transparent,
      builder: (context, model, child) => Scaffold(
        body: CustomContainer(
          shrinkWrap: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ResponsiveWidget(
                portraitLayout: Expanded(
                  flex: 4,
                  child: ImageContainer(),
                ),
                landscapeLayout: SizedBox(height: 0),
              ),
              Expanded(
                flex: 6,
                child: LoginForm(model),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm(this.model, {Key key}) : super(key: key);
  final AuthVM model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8 * SizeConfig.widthMultiplier),
      margin: EdgeInsets.only(bottom: 1 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FadeAnimation(
              delay: 1.5,
              child: Column(
                children: <Widget>[
                  Paragraft(
                    "Welcome back!",
                    textStyle: Theme.of(context).textTheme.title,
                  ),
                  Paragraft(
                    "Log in to your existant account of this App",
                    textStyle: Theme.of(context).textTheme.subtitle,
                  )
                ],
              )),
          FadeAnimation(
              delay: 1.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.black12,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromRGBO(196, 135, 198, .3),
                  //     blurRadius: 20,
                  //     offset: Offset(0, 10),
                  //   )
                  // ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputText(
                        name: "Username",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputText(
                        name: "Password",
                      ),
                    )
                  ],
                ),
              )),
          FadeAnimation(
              delay: 1.7,
              child: Center(
                  child: Text(
                "Forgot Password?",
                style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
              ))),
          FadeAnimation(
              delay: 1.9,
              child: GestureDetector(
                onTap: model.goToHome,
                child: Container(
                  height: 7 * SizeConfig.heightMultiplier,
                  // constraints: BoxConstraints(
                  //     minHeight: 6.5 * SizeConfig.heightMultiplier,
                  //     maxHeight: 7.9 * SizeConfig.heightMultiplier),
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
          FadeAnimation(
              delay: 2,
              child: GestureDetector(
                onTap: model.goToRegister,
                child: Center(
                    child: Text(
                  "Create Account",
                  style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                )),
              )),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          FadeAnimation(
              delay: 1,
              child: ClipPath(
                clipper: BackWaveClipper(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.primaryGradient,
                  )),
                ),
              )),
          FadeAnimation(
              delay: 1.3,
              child: ClipPath(
                clipper: FrontWaveClipper(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFC486C6),
                      Color(0xFF9D55E5),
                      Color(0xFFA138FE),
                    ],
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
