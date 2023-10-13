import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/common/widgets/stock_tile.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_bloc.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/bloc/bloc/stock_listing_state.dart';
import 'package:stock_watchlist/features/stock_listing/presentation/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [SearchFieldWidget(size: size)],
            ),
          ),
          BlocBuilder<StockListingBloc, StockListingState>(
            builder: (context, state) {
              if (state is StockFetchedState) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: 1,
                        (context, index) {
                  return StockTile(
                    stockSymbol: state.symbol,
                    stockPrice: state.stockPrice,
                    isAdd: true,
                  );
                }));
              } else {
                return SliverList(delegate: SliverChildListDelegate([]));
              }
            },
          )
        ],
      ),
    );
  }
}
