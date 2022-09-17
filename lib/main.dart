import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/shared/components/constants.dart';
import 'package:odc/shared/network/local/cache_helper.dart';
import 'package:odc/shared/network/remote/dio_helper.dart';

import 'layout/homeLayout/home_layout_screen.dart';
import 'modules/authentication/authScreen.dart';
import 'modules/splash/splash_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  rememberMe = CacheHelper.getData(key: 'rememberMe');

  if(token!=null&&rememberMe!=null){
    widget = const HomeLayoutScreen();
  }else{
    widget = const AuthScreen();
  }


  runApp(MyApp(
    startWidget: widget!,
  ));
}

class MyApp extends StatelessWidget {
   Widget startWidget;
   MyApp({Key? key,required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getPlants(token??"")..getProducts(token??"")..getSeeds(token??"")..getTools(token??"")..getBlogs(token??""),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {  },
        builder: (context,state) {
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: Splach(),
          );
        },
      ),
    );
  }
}

