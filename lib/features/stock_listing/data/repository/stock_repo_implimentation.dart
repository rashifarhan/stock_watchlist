import 'package:stock_watchlist/common/network/api_result.dart';
import 'package:stock_watchlist/common/repository/repository_helper.dart';
import 'package:stock_watchlist/features/stock_listing/data/datasource/remote/stock_listing_service.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_listing_response.dart';
import 'package:stock_watchlist/features/stock_listing/data/repository/stock_repo.dart';

class StockRepoImplimentation extends StockRepository{
  StockListingService stockListingService;

  StockRepoImplimentation({required this.stockListingService});
  @override
  Future<ApiResult<ApiResponse>>? getStockDetails(String companyName) {
   return RepositoryHelper<ApiResponse>()
        .checkItemsFailOrSuccess(stockListingService.getStockList(companyName));
  }
}