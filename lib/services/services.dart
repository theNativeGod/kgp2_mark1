import 'package:dio/dio.dart';

class Services {
  getNudityCheck(url) async {
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      'https://nsfw-nude-detection.p.rapidapi.com/function/nsfw-wrapper',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '692d5467c0mshe97c68ba53989f6p1998bbjsn77e8777b19d6',
          'X-RapidAPI-Host': 'nsfw-nude-detection.p.rapidapi.com',
        },
      ),
      queryParameters: {
        'url': url,
      },
    );
    print(response.data['nsfw_score']);
    if (response.data['nsfw_score'] > 0.6) {
      return true;
    } else {
      return false;
    }
  }
}
