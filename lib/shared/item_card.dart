import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final title;
  final subtitle;
  final value;
  final colors;
  ItemCard(this.title, this.subtitle, this.value, this.colors);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8),
        height: (MediaQuery.of(context).size.height / 3) * 0.65,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: colors),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 36, top: 8.0),
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}