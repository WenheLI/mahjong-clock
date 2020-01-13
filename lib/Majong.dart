import 'package:flutter/widgets.dart';

// Class of a single Majong widget
class Mahjong extends StatelessWidget {
  Mahjong(this.item);

  final String item;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 150,
      height: 200,
      padding: EdgeInsets.all(13.3),
      child: Image.asset(
          "assets/light/${this.item}.png",
        fit: BoxFit.fill,
      ),
    );
  }
}

class MahjongList extends StatelessWidget {

  final mahjongs = List<Widget>(10);

  MahjongList() {
    for(int i = 0; i < 10; i++){
      mahjongs[i] = (Mahjong(i.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mahjongs
    );
  }
}