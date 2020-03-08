import 'package:flutter/material.dart';
import 'package:ui_app/models/items.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BuildSlider extends StatefulWidget {
  final String image;
  final String title;
  BuildSlider({this.image, this.title});
  @override
  _BuildSliderState createState() => _BuildSliderState();
}

class _BuildSliderState extends State<BuildSlider> {
  final items = Items.items;
  final images = Items.images;
  Widget _buildimageSlider(context, int i) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed('/item'),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/${items[index]['img']}.jpg',
                  ),
                ),
              ),
            ),
          );
        },
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return ListView(children: <Widget>[
      Container(
        width: _width,
        child: _buildimageSlider(context, items.length),
      )
    ]);
  }
}
