import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:chef_leon_app/generated/i18n.dart';
import 'package:chef_leon_app/utils/app_constants.dart';

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class Gallery extends StatelessWidget {
  Gallery() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 8;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: AppConstants.app_bar_elevation,
        title: new Text(S.of(context).gallery_title),
      ),
      body: new StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        itemCount: _kItemCount,
        addRepaintBoundaries: true,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      ),
    );
  }
}

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 15.0,
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              //new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage(
                  placeholder: AssetImage('res/gallery/loading.gif'),
                  image: AssetImage('res/gallery/${index + 1}.PNG')
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
          )
        ],
      ),
    );
  }
}
