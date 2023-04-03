import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kgp2_mark1/services/services.dart';

class Photo with ChangeNotifier {
  String? _imgUrl;
  bool? _nudity;
  bool _loading = false;
  Services services = Services();

  //GETTER
  bool? get nudity => _nudity;
  bool get loading => _loading;

  //SETTER
  setImageUrl(url) {
    _imgUrl = url;
  }

  loader(load) {
    _loading = load;
    notifyListeners();
  }

  nudityCheck(url) async {
    
    loader(true);
    print('start');
    _nudity = await services.getNudityCheck(url);
    print('stop');
    loader(false);

    notifyListeners();
  }
}
