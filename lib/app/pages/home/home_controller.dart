import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository repository;

  HomeController(this.repository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await repository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos',
        ),
      );
    }
  }
}
