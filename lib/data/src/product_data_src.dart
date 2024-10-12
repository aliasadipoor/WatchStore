import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:watch_store/data/constants.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSrc {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getSorted(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;
  ProductRemoteDataSrc(this.httpClient);
  @override
  Future<List<Product>> getAllByBrand(int id) async {
    List<Product> products = <Product>[];
    final response =
        await httpClient.get(EndPoints.productsByBrand + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> products = <Product>[];
    final response =
        await httpClient.get(EndPoints.productsByCategory + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for (var elemnt in (response.data['products_by_category']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
    List<Product> products = <Product>[];
    final response = await httpClient.get(EndPoints.baseUrl + routeParam);

    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    debugPrint(response.statusCode.toString());
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
    List<Product> products = <Product>[];
    final response = await httpClient.get(EndPoints.baseUrl + searchKey);

    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(elemnt));
    }
    return products;
  }
}
