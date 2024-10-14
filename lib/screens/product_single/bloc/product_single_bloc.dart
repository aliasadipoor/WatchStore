import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/data/model/product_details.dart';
import 'package:watch_store/data/repository/product_repo.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepo _iProductRepo;
  ProductSingleBloc(this._iProductRepo) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInit) {
        try {
          emit(ProductSingleLoading());
          final productDetailes =
              await _iProductRepo.getProductDetailes(event.id);
          emit(ProductSingleLoaded(productDetailes));
        } catch (e) {
          emit(ProductSingleErorr());
        }
      }
    });
  }
}
