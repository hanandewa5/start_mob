import 'package:flutter/material.dart';

class IconBottom extends StatelessWidget {
  final String imgUrl;
  final String title;
  final Function onPress;

  const IconBottom({
    @required this.imgUrl,
    this.title,
    this.onPress,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              child: Image.asset(imgUrl),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.22,
              child: Text(title,textAlign: TextAlign.center, style: Theme.of(context).textTheme.body2),
            )
          ],
        ),
      ),
    );
  }
}
