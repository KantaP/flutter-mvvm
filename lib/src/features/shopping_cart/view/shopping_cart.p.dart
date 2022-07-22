import 'package:flutter/material.dart';
import 'package:prototype/src/features/shopping_cart/model/product.m.dart';
import 'package:prototype/src/features/shopping_cart/model/shopping_cart.st.dart';
import 'package:prototype/src/features/shopping_cart/view/di/shopping_cart.vm.dart';
import 'package:prototype/src/features/shopping_cart/view/shopping_cart.p.abs.dart';
import 'package:prototype/src/view_model/view.abs.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppingCartPage extends View<ShoppingCartPageViewModel> {

  const ShoppingCartPage({required ShoppingCartPageViewModel viewModel, Key? key}) : super.model(viewModel, key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState(viewModel);
}

class _ShoppingCartPageState extends ViewState<ShoppingCartPage, ShoppingCartPageViewModel> implements IShoppingCartPage {

  _ShoppingCartPageState(ShoppingCartPageViewModel viewModel) : super(viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }
  

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel.getProductList();
  }

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ShoppingCartPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final state = snapshot.data!; 
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).helloWorld),
            ),
            body: SafeArea(
              child: ListView.builder(
                itemBuilder: ((context, index) => buildProductItem(state.products[index])) ,
                itemCount: state.products.length
              )
            )
          );
        }
    );
  }
  

  @override
  Widget buildProductItem(Product item) {
    return Text(item.name ?? "");
  }
}