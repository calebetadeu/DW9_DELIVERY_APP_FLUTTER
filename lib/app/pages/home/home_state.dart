import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/models/product_model.dart';

part 'home_state.g.dart'; // Arquivo gerado automaticamente

@match
enum HomeStateStatus { 
  initial, 
  loading,
  loaded ,
  error
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;

  const HomeState(this.errorMessage, {required this.status, required this.products});
  
  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null;
  @override
  List<Object?> get props => [status, products,errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
  }) {
    return HomeState(
      errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }


}