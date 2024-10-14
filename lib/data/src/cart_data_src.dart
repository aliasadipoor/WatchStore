import 'package:dio/dio.dart';
import 'package:watch_store/data/constants.dart';
import 'package:watch_store/data/model/cart.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();
  Future<int> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<int> deleteFromCart({required int productId});
  Future<int> countCartItem();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpCilent;

  static const productIdJsonKey = 'product_id';
  CartRemoteDataSrc(this.httpCilent);

  @override
  Future<int> addToCart({required int productId}) async =>
      await httpCilent.post(EndPoints.addToCart,
          data: {productIdJsonKey: productId}).then((value) {
        HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return (value.data["data"]["user_cart"] as List).length;
      });

  @override
  Future<int> deleteFromCart({required int productId}) async =>
      await httpCilent.post(EndPoints.deleteFromCart,
          data: {productIdJsonKey: productId}).then((value) {
        HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return (value.data["data"]["user_cart"] as List).length;
      });

  @override
  Future<void> removeFromCart({required int productId}) async =>
      await httpCilent.post(EndPoints.removeFromCart, data: {
        productIdJsonKey: productId
      }).then((value) =>
          HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0));

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartlist = <CartModel>[];
    final response = await httpCilent.post(EndPoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var e in (response.data["data"]["user_cart"] as List)) {
      cartlist.add(CartModel.fromJson(e));
    }
    return cartlist;
  }

  @override
  Future<int> countCartItem() async {
    final response = await httpCilent.post(EndPoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data["data"]["user_cart"] as List).length;
  }
}
