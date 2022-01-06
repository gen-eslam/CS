import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildItem(),
        separatorBuilder: (context, index) => buildSeparatedItem(),
        itemCount: 10);
  }
}

Widget buildItem() => Container(
      width: double.infinity,
      height: 100,
    );

Widget buildSeparatedItem() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.black,
    );
