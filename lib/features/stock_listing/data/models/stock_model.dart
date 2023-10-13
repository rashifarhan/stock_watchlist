import 'package:hive/hive.dart';
part 'stock_model.g.dart';

@HiveType(typeId: 1)
class StockModel {
  
  @HiveField(0)
  final String symbol;
  @HiveField(1)
  final String stockPrice;
  @HiveField(2)
  int? id;


  StockModel({required this.symbol, required this.stockPrice,this.id});
}
