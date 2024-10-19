part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialSate extends CartState {}

final class CartLoadingSate extends CartState {}

final class CartErorrSate extends CartState {}

final class CartLoadedSate extends CartState {
  final List<CartModel> cartList;

  const CartLoadedSate(this.cartList);
}

final class CartItemDeletedSate extends CartState {
  final List<CartModel> cartList;

  const CartItemDeletedSate(this.cartList);
}

final class CartItemRemovedSate extends CartState {
  final List<CartModel> cartList;

  const CartItemRemovedSate(this.cartList);
}

final class CartItemAddedSate extends CartState {
  final List<CartModel> cartList;

  const CartItemAddedSate(this.cartList);
}

final class CartCountItemState extends CartState {}
