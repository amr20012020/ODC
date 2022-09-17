import 'package:flutter/cupertino.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/network/local/cache_helper.dart';

void signOut(context,widget)
{
  CacheHelper.removeData(key: 'token')
      .then((value){
        if(value){
          navigateAndFinish(context, widget);
          showToast(text: 'LogOut',state: ToastStates.WARNING);
        }
  });
}


String? token;
String baseUrl='https://lavie.orangedigitalcenteregypt.com';
bool? rememberMe;
Widget? widget;