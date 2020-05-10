import 'package:start_mob/views/_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:start_mob/views/_widgets/Text/Paragraft.dart';

class InputDisabled extends StatelessWidget {
  final String title;
  final String value;
  final bool isVertical;
  final bool isBottomBorder;
  final double width1;

  InputDisabled(
      {this.title,
      this.value,
      this.isVertical = true,
      this.width1,
      this.isBottomBorder = true});

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            children: <Widget>[
              ListTile(
                dense: true,
                contentPadding: UIHelper.marginHorizontal(0),
                title: Paragraft(title, fontSize: 14),
                subtitle: Paragraft(
                  value != null ? value : "N/A",
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              isBottomBorder
                  ? Divider(
                      height: 1,
                      thickness: 2,
                    )
                  : SizedBox(height: 0)
            ],
          )
        : Row(
            children: <Widget>[
              SizedBox(
                width: width1,
                child: Paragraft(
                  title,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              Paragraft(
                value != null ? value : "N/A",
                fontSize: 14,
              ),
            ],
          );
  }
}
