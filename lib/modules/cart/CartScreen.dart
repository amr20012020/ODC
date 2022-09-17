import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/AppCubit.dart';
import '../../layout/homeLayout/home_layout_screen.dart';
import '../../layout/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("My Cart", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => HomeLayoutScreen(),
                  ),
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>false,
              widgetBuilder: (BuildContext context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cart1.png',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Your cart is empty',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Sorry, the keyword you entered cannot',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),
                    Text('be found, please check again or search with',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),

                    Text('another keyword.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),
                  ],
                ),
              ),
              fallbackBuilder: (BuildContext context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cart1.png',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Your cart is empty',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Sorry, the keyword you entered cannot',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),
                    Text('be found, please check again or search with',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),

                    Text('another keyword.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: HexColor('#2121219C'),
                        fontSize: 18,
                      ),),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}