import 'package:flutter/material.dart';
import 'package:stock_watchlist/common/widgets/stock_tile.dart';
import 'package:stock_watchlist/features/stock_listing/data/datasource/local/local_services.dart';

class DisplayStock extends StatelessWidget {
  const DisplayStock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    getAllStock();

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: stockListNotifier,
          builder: (context, value, child) {
            return value.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                           
                            return StockTile(
                                stockSymbol: value[index].symbol,
                                stockPrice: value[index].stockPrice,
                                isAdd: false,
                                id: value[index].id,
                                );
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: Text("No Saved Stocks"),
                  );
          },
        ),
      ),
    );
  }
}
