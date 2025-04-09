import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:dw9_delivery_app/app/core/exceptions/repository_exceptions.dart';
import 'package:dw9_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

import './products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  late final CustomDio dio;
  ProductsRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>((e) => ProductModel.fromMap(e))
          .toList();
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar produtos',
        name: 'ProductsRepositoryImpl',
        error: e,
        stackTrace: s,
      );
      throw RepositoryExceptions(message: 'Erro ao buscar produtos');
    }
  }
}
