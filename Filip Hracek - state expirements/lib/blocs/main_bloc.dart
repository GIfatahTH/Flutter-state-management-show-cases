import 'package:flutter/material.dart';

import 'bloc_setting.dart';
export 'bloc_setting.dart';

import '../common/models/cart_item.dart';
import '../common/models/cart.dart';
import '../common/models/catalog.dart';
import '../common/models/product.dart';

class MainBloc extends BloCSetting {
  List<Product> products;
  List<CartItem> items;
  int itemCount = 0;
  bool isLoaded = false;

  final cart = Cart();

  init(state) async {
    final Catalog catalog = await fetchCatalog();
    products = catalog.products;
    isLoaded = true;
    rebuildWidgets(states: [state]);
  }

  cartAddition(Product product) {
    cart.add(product);
    items = cart.items;
    itemCount = cart.itemCount;
    rebuildWidgets(ids: ["cartButtonState"]);
  }

  cartRemoval(CartItem item, state) {
    cart.remove(item.product);
    items = cart.items;
    itemCount = cart.itemCount;
    item.count > 1
        ? rebuildWidgets(states: [state])
        : rebuildWidgets(ids: ["cartPageBodyState"]);
  }

  getIcon() => (itemCount > 2) ? Icon(Icons.add) : Text("noop");
}

MainBloc mainBloc;
