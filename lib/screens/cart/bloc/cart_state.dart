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

final class CartItemDeletedSate extends CartState {}

final class CartItemRemovedSate extends CartState {}

final class CartItemAddedSate extends CartState {}

final class CartCountItemState extends CartState {}
