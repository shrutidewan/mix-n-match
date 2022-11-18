import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';

import '../../redux/actions.dart';
import '../../redux/store.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickTopsImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (!mounted) return;
    StoreProvider.of<AppState>(context).dispatch(
      UpdateTopImages(topImages: images),
    );
  }

  Future<void> _pickBottomsImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (!mounted) return;
    StoreProvider.of<AppState>(context).dispatch(
      UpdateBottomImages(bottomImages: images),
    );
  }

  Future<void> _pickShoesImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    if (!mounted) return;
    StoreProvider.of<AppState>(context).dispatch(
      UpdateShoesImages(shoesImages: images),
    );
  }

  Widget _getImageCard(XFile f) {
    return Card(
      child: Image(
        width: 170.0,
        fit: BoxFit.cover,
        image: FileImage(
          File(f.path),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: const Text(
                      'Mix n Match',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tops',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _pickTopsImages(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...state.topImages
                            .map(
                              (f) => _getImageCard(f),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bottoms',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _pickBottomsImages(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...state.bottomImages
                            .map(
                              (f) => _getImageCard(f),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shoes',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _pickShoesImages(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 170,
                    width: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...state.shoesImages
                            .map(
                              (f) => _getImageCard(f),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// StoreProvider.of<AppState>(context)
// .dispatch(ToggleTheme(darkTheme: value!));
