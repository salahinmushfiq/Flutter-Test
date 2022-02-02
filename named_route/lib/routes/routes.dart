import 'package:named_route/pages/home_page.dart';
import 'package:named_route/pages/cart.dart';
import 'package:named_route/pages/item_view.dart';
import 'package:named_route/pages/account.dart';

routes() {
  return {
    MyHomePage.route: (context) => MyHomePage(),
    Account.route: (context) => Account(),
    ItemView.route: (context) => ItemView(),
    Cart.route: (context) => Cart(),
  };
}
