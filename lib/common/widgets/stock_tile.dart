import 'package:flutter/material.dart';
import 'package:stock_watchlist/features/stock_listing/data/datasource/local/local_services.dart';
import 'package:stock_watchlist/features/stock_listing/data/models/stock_model.dart';
import 'package:stock_watchlist/features/stock_saving/data/datasource/local/local_services.dart';

class StockTile extends StatelessWidget {
  final String stockSymbol;
  final String stockPrice;
  int? id;
  final bool isAdd;
  


   StockTile(
      {super.key, required this.stockSymbol, required this.stockPrice,required this.isAdd,this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Text(
          stockSymbol,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        stockSymbol,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        'Share Price: $stockPrice',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: IconButton(onPressed: () {
       final stockModel= StockModel(symbol: stockSymbol, stockPrice: stockPrice);
        if(isAdd==true){
          addStock(stockModel);
        }else{
          if(id!=null){
          
          deleteStock(id!);

          }else{
            print("id is null");
          }
        }

      }, icon:  Icon(isAdd==true?Icons.add: Icons.delete)),
    );
  }
}
