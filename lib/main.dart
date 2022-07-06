import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:entry/entry.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            title: 'Image Slider Demo',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Image Slider Demo'),
                backgroundColor: Colors.red[300],
              ),
              body: const ImageSlider(),
            ));
      },
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  static const images = <String>[
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-3.jpg',
  ];

  int _currentIndex = 0;
  final int _imagesNumber = images.length;

  void _onForward() => setState(() => {
        if (_currentIndex + 1 < _imagesNumber)
          _currentIndex++
        else
          _currentIndex = 0
      });

  void _onBackward() => setState(() => {
        if (_currentIndex > 0)
          _currentIndex--
        else
          _currentIndex = _imagesNumber - 1
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(shape: BoxShape.rectangle),
      child: Row(
        children: [
          IconButton(
            onPressed: _onBackward,
            icon: const Icon(Icons.arrow_back),
            padding: const EdgeInsets.all(4.0),
            splashRadius: 15,
          ),
          Entry.scale(
              child: Image.network(
            images.elementAt(_currentIndex),
            width: 40.w,
            height: 40.h,
            fit: BoxFit.fitWidth,
          )),
          IconButton(
            onPressed: _onForward,
            icon: const Icon(Icons.arrow_forward),
            padding: const EdgeInsets.all(4.0),
            splashRadius: 15,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
