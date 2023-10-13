

import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_listing_response.dart';
import 'package:stock_watchlist/features/stock_listing/data/repository/stock_repo.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_event.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_state.dart';

class StockListingBloc extends Bloc<StockListingEvent, StockListingState> {
  final StockRepository stockRepository;
  List<ApiResponse> stockList=[];
  StockListingBloc(this.stockRepository) : super(Initial()) {
    on<FetchStock>(fetchStock);
  }





  FutureOr<void> fetchStock(FetchStock event, Emitter<StockListingState> emit)async {
    var response=await stockRepository.getStockDetails(event.companyName);
    response?.when(success: (data) {
      
      print(data);

      emit(StockFetchedState(symbol: data.companyName??"", stockPrice: data.latestStockPrice??""));
    }, failure: (error) {
      log(error);
      emit(genericErrorState(erroerMessage: error));
    },);
  }
}
