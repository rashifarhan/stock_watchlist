import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_listing_response.freezed.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @Default('') String? companyName,
    @Default('') String? latestStockPrice,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final metaData = json['Meta Data'];
    final timeSeries = json['Time Series (5min)'];

    return ApiResponse(
      companyName: metaData['2. Symbol'] ?? '',
      latestStockPrice: timeSeries?.values.first['4. close'] ?? '',
    );
  }
}
