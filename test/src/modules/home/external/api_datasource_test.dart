import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/external/datasources/api_datasource.dart';
import 'package:qcx_exercise/src/network/custom_dio.dart';

void main(){
  final datasource = ApiDatasource(CustomDio().client);

  test("Deverá retornar uma lista de Characters", () async {

    final response = await datasource.loadCharacters(PaginationParams(page: 1, next: ""));
    expect(response.characterList.isNotEmpty, true);
  });
}