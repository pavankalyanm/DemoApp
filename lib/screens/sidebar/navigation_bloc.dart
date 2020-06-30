import 'package:bloc/bloc.dart';
import 'package:login/screens/cart.dart';
import 'package:login/screens/sidebar/pages/myaccountspage.dart';
import 'package:login/screens/sidebar/pages/myorderspage.dart';
import 'package:login/screens/sidebar/pages/homepage.dart';
import 'package:login/screens/wishlist.dart';



import 'pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
  WishlistClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
       case NavigationEvents.WishlistClickedEvent:
        yield Wishlist();
        break;  
      
    }
  }
}
