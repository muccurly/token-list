import 'package:dio/dio.dart';
import 'package:jurta_app/src/data/entity/other_structure.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/data/remote/api_client.dart';
import 'package:jurta_app/src/data/remote/i_other_structures_remote_data_source.dart';

class OtherStructuresRemoteDataSourceImpl
    implements IOtherStructuresRemoteDataSource {
  @override
  Future<OtherStructure> getOtherStructureById(String path, int id) async {
    Response response = await ApiClient.instance.dDio.get('$path/$id');
    if (response.statusCode == 200)
      return OtherStructure.fromJson(response.data);
    else
      throw Exception('$path api exception');
  }

  @override
  Future<List<OtherStructure>> getOtherStructuresByIdList(
      String path, List<int> ids) async {
    Response response =
        await ApiClient.instance.dDio.get('$path/${ids.join(',')}');
    if (response.statusCode == 200)
      return (response.data as List)
          .map((e) => OtherStructure.fromJson(e))
          .toList();
    else
      throw Exception('$path list api exception');
  }

  Future<ResidentialComplex> getResidentialById(int id) async {
    Response response =
        await ApiClient.instance.gmDio.get('residential-complexes/$id');
    if (response.statusCode == 200)
      return ResidentialComplex.fromJson(response.data);
    else
      throw Exception('complex api exception');
  }
}
