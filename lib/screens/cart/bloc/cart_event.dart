part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class cartInitEvent extends CartEvent {}
class CartCountItemEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;

  const AddToCartEvent(this.productId);
}

class RemoveFromCartEvent extends CartEvent {
  final int productId;

  const RemoveFromCartEvent(this.productId);
}

class DeleteFromCartEvent extends CartEvent {
  final int productId;

  const DeleteFromCartEvent(this.productId);
}
