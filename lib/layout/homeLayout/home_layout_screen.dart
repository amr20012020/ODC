import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/modules/authentication/authScreen.dart';
import 'package:odc/modules/authentication/cubit/cubit.dart';
import 'package:odc/modules/authentication/cubit/states.dart';
import 'package:odc/modules/home/home_screen.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/styles/icon_broken.dart';

import '../../modules/address/addressScreen.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              items: <Widget>[
                ImageIcon(
                  AssetImage("assets/images/leave.png"),
                  color: cubit.currentIndex==0?Colors.white:Colors.green,
                ),
                Icon(
                  IconBroken.Scan,
                  color: cubit.currentIndex==1?Colors.white:Colors.green,
                ),
                Icon(
                  IconBroken.Home,
                  color: cubit.currentIndex==2?Colors.white:Colors.green,
                ),
                Icon(
                  IconBroken.Notification,
                  color: cubit.currentIndex==3?Colors.white:Colors.green,
                ),
                Icon(
                  IconBroken.User1,
                  color: cubit.currentIndex==4?Colors.white:Colors.green,
                ),
              ],
              index: cubit.currentIndex,
              height: 64.0,
              color: HexColor('#faf9f7'),
              buttonBackgroundColor: Colors.green,
              backgroundColor: Colors.white,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index){
                //navigateTo(context, HomeScreen());
                cubit.changeBottom(index);
              },
              letIndexChange: (index) => true,
            ),
          );
        },

    );
  }
}
