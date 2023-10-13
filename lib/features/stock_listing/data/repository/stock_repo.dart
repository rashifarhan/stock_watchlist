import 'package:stock_watchlist/common/network/api_result.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_listing_response.dart';

abstract class StockRepository{
   Future<ApiResult<ApiResponse>>? getStockDetails(String companyName);
}