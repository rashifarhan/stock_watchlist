

import 'package:stock_watchlist/features/stock_listing/data/models/stock_listing_response.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_model.dart';

abstract class StockListingState{}

class Initial extends StockListingState{}

class StockFetchedState extends StockListingState{
  final String symbol;
  final String stockPrice;

  StockFetchedState({required this.symbol, required this.stockPrice});
  
  
}

class genericErrorState extends StockListingState{
  final String erroerMessage;

  genericErrorState({required this.erroerMessage});
}