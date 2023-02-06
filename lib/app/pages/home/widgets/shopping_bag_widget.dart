import 'package:flutter/material.dart';
import 'package:flutter_burger_restaurant_app/app/core/extensions/formatter_extension.dart';
import 'package:flutter_burger_restaurant_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter_burger_restaurant_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter_burger_restaurant_app/app/pages/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../dto/order_product_dto.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDTO> bag;

  const ShoppingBagWidget({super.key, required this.bag});

  Future<void> _goOrder(BuildContext context) async{
    final navigator = Navigator.of(context);
    final controller = context.read<HomeController>();
    final sp = await SharedPreferences.getInstance();
    if(!sp.containsKey('accessToken')){
      //enviar para login
      final loginResult = await navigator.pushNamed('/auth/login');

      if(loginResult == null || loginResult == false){
        return;
      }
    }
    final updatedBag = await navigator.pushNamed('/order', arguments: bag);
    controller.updateBag(updatedBag as List<OrderProductDTO>);
  }

  @override
  Widget build(BuildContext context) {

    var totalBag = bag
        .fold<double>(0.0, (total, element) => total += element.totalPrice)
        .currencyPTBR;

    return Container(
      width: context.screenWidth,
      height: 70,
      padding: EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.shopping_cart_outlined)),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ver Sacola",
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
