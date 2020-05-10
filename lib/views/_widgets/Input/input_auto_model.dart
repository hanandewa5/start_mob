import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:start_mob/views/_helpers/text_helper.dart';
import 'package:start_mob/views/_helpers/ui_helpers.dart';
import 'package:start_mob/views/_widgets/Text/Paragraft.dart';

typedef String InputAutoBuildeType<T>(BuildContext context, T item);
typedef String InputAutoBuildItemType<T>(BuildContext context, T item);
typedef String InputItem<T>(BuildContext context, T item);

class InputAutoModel<T> extends StatelessWidget {
  final String name;
  final T value;
  final bool isError;
  final Function(T) onChange;
  final List<T> list;
  final bool isSearch;
  final InputAutoBuildeType<T> buildInput;
  final InputAutoBuildItemType<T> buildItem;

  InputAutoModel(
      {this.isError = false,
      this.value,
      this.onChange,
      @required this.list,
      this.name,
      this.isSearch = false,
      this.buildInput,
      this.buildItem,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _colorPrimary = Theme.of(context).primaryColor;
    return FindDropdown<T>(
      items: list,
      showSearchBox: isSearch,
      onChanged: onChange,
      selectedItem: value,
      // onChanged: (Condition item) => model.setCondition(item),
      // selectedItem: model.condition,
      dropdownBuilder: (BuildContext context, T item) {
        return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2, color: Theme.of(context).primaryColor))),
            alignment: Alignment.centerLeft,
            child: ListTile(
                contentPadding: EdgeInsets.all(0),
                trailing: Icon(Icons.arrow_drop_down_circle),
                title: Text(
                  name,
                  style: textSmall
                      .merge(TextStyle(color: Theme.of(context).primaryColor)),
                ),
                subtitle: (item != null)
                    ? Text(
                        buildInput(context, item),
                        style: textMedium.merge(TextStyle(color: Colors.black)),
                      )
                    : Text("Pilih $name")));
      },
      dropdownItemBuilder: (BuildContext context, T item, bool isSelected) {
        return Container(
          // child: ListTile(
          //   leading: Icon(
          //     Icons.search,
          //     color: isSelected ? _colorPrimary : Colors.black87,
          //   ),
          //   title: Paragraft(text:buildItem(context, item),color: isSelected ? _colorPrimary:Colors.black87,),
          // ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: isSelected ? _colorPrimary : Colors.black87,
              ),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                child: Paragraft(
                  buildItem(context, item),
                  color: isSelected ? _colorPrimary : Colors.black87,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
