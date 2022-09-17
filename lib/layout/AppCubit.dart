import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/models/PostModel.dart';
import 'package:odc/models/plants_model/PlantsModel.dart';
import 'package:odc/models/products_model/ProductsModel.dart';
import 'package:odc/models/seeds_model/SeedsModel.dart';
import 'package:odc/models/tools_model/ToolsModel.dart';
import 'package:odc/models/user_model/UserModel.dart';
import 'package:odc/modules/blog_details/blog_details.dart';
import 'package:odc/modules/home/home_screen.dart';
import 'package:odc/modules/posts/posts_screen.dart';
import 'package:odc/modules/profile/Profile.dart';
import 'package:odc/shared/network/end_points.dart';
import 'package:odc/shared/network/remote/dio_helper.dart';

import '../location_helper.dart';
import '../models/blogs_model/BlogsModel.dart';
import '../modules/notification/NotificationScreen.dart';
import '../shared/components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;
  PageController pageController = PageController(initialPage: 2);

  void changeBottom(int index) {
    currentIndex = index;
    getPlants(token!);
    if(index==2)
      {
        getPlants(token!);
        getSeeds(token!);
        getTools(token!);
        getProducts(token!);
        getBlogs(token!);
      }
    emit(AppChangeBottomNavState());
  }


  List<Widget> screens =
  [
    const PostsScreen(),
    const ProfileScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];


  UserModel? userModel;

  void getUserData(String token){
    emit(AppLoadingUserDataState());
    DioHelper.getData(
        url: USER_DATA,
        token: token,
    ).then((value){
      userModel = UserModel.fromJson(value.data);
      emit(AppSuccessUserDataState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorUserDataState(error: error.toString()));
    });
  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // if location is not enabled
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    getCurrentLocation();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    position = await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
  }

  Position? position;


  Future<void> getCurrentLocation() async {
    await LocationHelper.determinePosition();
    position = await Geolocator.getLastKnownPosition();
    getAddress(position);
    print('My LAT LOG ....');
    print(position?.longitude);
    print(position?.latitude);
    emit(AppSuccessGetLocationState());
  }

  dynamic address;
  Future<void> getAddress(Position? p) async
  {
    List<Placemark> placemarks = await placemarkFromCoordinates(p!.latitude, p.longitude);
    address = placemarks[0].locality;
  }


  PlantsModel? plantsModel;
  void getPlants(String token){
    emit(AppLoadingGetPlantsState());
    DioHelper.getData(
        url: PLANTS,
        token: token,
    ).then((value){
      plantsModel = PlantsModel.fromJson(value.data);
      emit(AppSuccessGetPlantsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetPlantsState(error: error.toString()));
    });
  }

  ProductsModel? productsModel;
  void getProducts(String token){
    emit(AppLoadingGetProductsState());
    DioHelper.getData(
      url: PRODUCTS,
      token: token,
    ).then((value){
      productsModel = ProductsModel.fromJson(value.data);
      emit(AppSuccessGetProductsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetProductsState(error: error.toString()));
    });
  }

  SeedsModel? seedsModel;
  void getSeeds(String token){
    emit(AppLoadingGetSeedsState());
    DioHelper.getData(
      url: SEEDS,
      token: token,
    ).then((value){
      seedsModel = SeedsModel.fromJson(value.data);
      emit(AppSuccessGetSeedsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetSeedsState(error: error.toString()));
    });
  }


  ToolsModel? toolsModel;
  void getTools(String token){
    emit(AppLoadingGetToolsState());
    DioHelper.getData(
      url: TOOLS,
      token: token,
    ).then((value){
      toolsModel = ToolsModel.fromJson(value.data);
      emit(AppSuccessGetToolsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetToolsState(error: error.toString()));
    });
  }


  BlogsModel? blogsModel;
  void getBlogs(String token){
    emit(AppLoadingGetBlogsState());
    DioHelper.getData(
      url: BLOGS,
      token: token,
    ).then((value){
      blogsModel = BlogsModel.fromJson(value.data);
      emit(AppSuccessGetBlogsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetBlogsState(error: error.toString()));
    });
  }


  MyPostsModel? myPostsModel;
  void getPostS(String token){
    emit(AppLoadingGetMyPostsState());
    DioHelper.getData(
        url: MY_POSTS,
        token: token,
    ).then((value) {
      myPostsModel = MyPostsModel.fromJson(value.data);
      emit(AppSuccessGetMyPostsState());
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      emit(AppErrorGetMyPostsState(error: error.toString()));
    });
  }
}