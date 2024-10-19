import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/model/cart.dart';
import 'package:watch_store/data/repository/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _iCartRepository;
  CartBloc(this._iCartRepository) : super(CartInitialSate()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is cartInitEvent) {
          emit(CartLoadingSate());
          final cartList = await _iCartRepository.getUserCart();
          emit(CartLoadedSate(cartList));
        } else if (event is RemoveFromCartEvent) {
          await _iCartRepository
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemovedSate(value)));
        } else if (event is DeleteFromCartEvent) {
          await _iCartRepository
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeletedSate(value)));
        } else if (event is AddToCartEvent) {
          emit(CartLoadingSate());

          await _iCartRepository
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedSate(value)));
        } else if (event is CartCountItemEvent) {
          emit(CartLoadingSate());

          await _iCartRepository
              .countCartItem()
              .then((value) => emit(CartCountItemState()));
        }
      } catch (e) {
        emit(CartErorrSate());
      }
    });
  }
}
