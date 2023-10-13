
import 'package:dio/dio.dart';
import 'package:stock_watchlist/common/network/api_config.dart';
import 'package:stock_watchlist/common/network/api_helper.dart';
import 'package:stock_watchlist/common/network/dio_client.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_listing_response.dart';


class StockListingService with ApiHelper{
  Dio dio=Dio();
    Future<ApiResponse> getStockList(String companyName)async{
    var response=await ApiClient().dio.get("function=TIME_SERIES_INTRADAY&symbol=$companyName&interval=5min&apikey=${APiConfig.apiKey}");
   
    return ApiResponse.fromJson(response.data);
}
}




