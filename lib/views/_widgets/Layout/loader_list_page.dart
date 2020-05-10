import 'package:flutter/material.dart';

class LoaderListPage extends StatelessWidget {
  final bool isLoading;
  final int length;
  final Future<void> Function() refresh;
  final String listType;

  final Widget child;

  LoaderListPage(
      {this.refresh,
      this.listType = "list",
      this.isLoading,
      this.length,
      this.child,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
        onRefresh: refresh,
        child: (listType == "list")
            ? Container(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : length == 0
                        ? SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text("Data Kosong"),
                              ),
                            ),
                          )
                        : child,
              )
            : (listType == "grid")
                ? SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                      height: length == 0 || isLoading ? _height - 155 : null,
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : length == 0
                              ? Center(
                                  child: Text("Data Kosong"),
                                )
                              : child,
                    ),
                  )
                : Text("This Page Not Build Properly"));
  }
}
