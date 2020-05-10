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

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthVM>(
      statusBarColor: Colors.transparent,
      builder: (context, model, child) => Scaffold(
        body: CustomContainer(
          shrinkWrap: false,
          child: Stack(
            children: <Widget>[
              ResponsiveWidget(
                portraitLayout: Container(
                  height: 30 * SizeConfig.heightMultiplier,
                  child: ImageContainer(),
                ),
                landscapeLayout: SizedBox(height: 0),
              ),
              LoginForm(model)
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
                    "Create your account!",
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.title,
                  ),
                  Paragraft(
                    "Please make sure your data filled correcty",
                    color: Colors.white70,
                    textStyle: Theme.of(context).textTheme.subtitle,
                  )
                ],
              )),
          FadeAnimation(
              delay: 1.7,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputText(
                        name: "Nama",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputText(
                        name: "Email",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputText(
                        name: "Handphone",
                      ),
                    ),
                  ],
                ),
              )),
          FadeAnimation(
              delay: 1.9,
              child: GestureDetector(
                onTap: model.goToHome,
                child: Container(
                  height: 7 * SizeConfig.heightMultiplier,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
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
          // FadeAnimation(
          //     delay: 1.3,
          //     child: ClipPath(
          //       clipper: FrontWaveClipper(),
          //       child: Container(
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //             gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: [
          //             Color(0xFFC486C6),
          //             Color(0xFF9D55E5),
          //             Color(0xFFA138FE),
          //           ],
          //         )),
          //       ),
          //     ))
        ],
      ),
    );
  }
}
