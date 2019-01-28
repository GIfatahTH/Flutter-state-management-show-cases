import 'package:flutter/material.dart';

import '../utils/is_dark.dart';

import '../../blocs/main_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: CartPageBody(),
    );
  }
}

class CartPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      stateID: "cartPageBodyState",
      blocs: [mainBloc],
      builder: (_) => mainBloc.items.isEmpty
          ? Center(
              child: Text('Empty', style: Theme.of(context).textTheme.display1),
            )
          : ListView.builder(
              itemCount: mainBloc.items.length,
              itemBuilder: (_, index) => ItemTile(index),
            ),
    );
  }
}

class ItemTile extends StatelessWidget {
  ItemTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(mainBloc.items[index].product.color)
            ? Colors.white
            : Colors.black);

    return StateBuilder(
      builder: (state) => Container(
            color: mainBloc.items[index].product.color,
            child: ListTile(
              title: Text(
                mainBloc.items[index].product.name,
                style: textStyle,
              ),
              trailing: CircleAvatar(
                  backgroundColor: const Color(0x33FFFFFF),
                  child: Text(mainBloc.items[index].count.toString(),
                      style: textStyle)),
              onTap: () => mainBloc.cartRemoval(mainBloc.items[index], state),
            ),
          ),
    );
  }
}
