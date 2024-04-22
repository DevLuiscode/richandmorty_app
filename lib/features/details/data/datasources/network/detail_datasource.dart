import 'package:dio/dio.dart';
import 'package:rick_morty_app/features/details/data/datasources/network/models/charter_id_db.dart';

class DetailDatasource {
  final dio = Dio();

  Future<CharterIdDb> fetchIdCharter(int id) async {
    try {
      var domain = "https://rickandmortyapi.com/api/character/$id";
      Response response = await dio.get(domain);

      final charter = CharterIdDb.fromJson(response.data);
      return charter;
    } catch (e) {
      throw Exception('Failed to process characters data');
    }
  }
}
