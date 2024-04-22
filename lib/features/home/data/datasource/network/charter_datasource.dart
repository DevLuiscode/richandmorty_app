import 'package:dio/dio.dart';
import 'package:rick_morty_app/features/home/data/datasource/network/model/charter_api_db.dart';
import 'package:rick_morty_app/features/home/data/datasource/network/model/charter_result.dart';

class CharterDatasource {
  Future<List<CharterResult>> fetchCharters({required int page}) async {
    final dio = Dio();
    try {
      Response response = await dio
          .get("https://rickandmortyapi.com/api/character/", queryParameters: {
        "page": page,
      });

      final chartersApiDb = CharterApiDb.fromJson(response.data);

      return chartersApiDb.results;
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      throw Exception('Failed to load characters');
    } catch (e) {
      throw Exception('Failed to process characters data');
    }
  }
}
