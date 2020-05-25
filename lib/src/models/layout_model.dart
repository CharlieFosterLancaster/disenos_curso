import 'package:disenos_curso/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }
  
}