import 'package:flutter/material.dart';
import 'package:marvel_universe/constants.dart';

abstract class ProviderClass extends ChangeNotifier {
  final domain = MarvelApiData.domain;
  final hash = MarvelApiData.hash;
  final ts = MarvelApiData.ts;
  final key = MarvelApiData.key;
}
