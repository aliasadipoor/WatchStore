import 'package:flutter/material.dart';
import 'package:watch_store/data/config/remote_config.dart';
import 'package:watch_store/data/model/cart.dart';
import 'package:watch_store/data/src/cart_data_src.dart';

abstract class ICartRepository {
  Future<List<CartModel>> getUserCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deleteFromCart({required int productId});
  Future<int> countCartItem();
}

class CartRepo implements ICartRepository {
  final ICartDataSrc _cartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);
  CartRepo(this._cartDataSrc);
  @override
  Future<List<CartModel>> addToCart({required int productId}) =>
      _cartDataSrc.addToCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> deleteFromCart({required int productId}) =>
      _cartDataSrc.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.length;
        return value;
      });

  @override
  Future<List<CartModel>> getUserCart() => _cartDataSrc.getUserCart();
  @override
  Future<List<CartModel>> removeFromCart({required int productId}) =>
      _cartDataSrc.removeFromCart(productId: productId);

  @override
  Future<int> countCartItem() =>
      _cartDataSrc.countCartItem().then((value) => cartCount.value = value);
}

final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));
