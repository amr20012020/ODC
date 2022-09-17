import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/models/LoginModel.dart';
import 'package:odc/modules/authentication/cubit/states.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_points.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  int currentIndex = 2;

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;


  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.vibration_outlined;
    emit(LoginChangePasswordVisibilityState());
  }


  IconData suffix2 = Icons.visibility_off_outlined;
  bool isPassword2 = true;

  void changePasswordVisibility2(){
    isPassword2 = !isPassword2;
    suffix2 = isPassword2 ? Icons.visibility_off_outlined : Icons.vibration_outlined;
    emit(SignUpChangePasswordVisibilityState());
  }

  bool LoginisChecked = false;
  bool RegisterisChecked = false;



  void loginRememberMe(value){
    LoginisChecked = value;
    emit(LoginIsChecked());
  }

  void registerRememberMe(value){
    RegisterisChecked = value;
    emit(RegisterIsChecked());
  }





  void userLogin({
     required String email,
     required String password,
}){
    emit(LoginLoadingState());

    DioHelper.postData(
        url: LOGIN,
        data: {
          'email' : email,
          'password' : password,
        }).then((value){
          if(kDebugMode){
            print(value.data);
          }
          loginModel = LoginModel.fromJson(value.data);
          emit(LoginSuccessState(loginModel));
    }).catchError((error){
      if(kDebugMode){
        print(error.toString());
      }
      if(error is DioError){
        showToast(state: ToastStates.ERROR,text: error.response!.data!['message']);
      }
      emit(LoginErrorState(error.toString()));
    });
  }
  
  
  void UserRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
}){
    emit(RegisterLoadingState());
    
    DioHelper.postData(
        url: REGISTER,
        data: {
          'email' : email,
          'firstName' : firstName,
          'lastName' : lastName,
          'password' : password,
        }).then((value){
          loginModel = LoginModel.fromJson(value.data);
          emit(RegisterSuccessState(loginModel));
    }).catchError((error){
      if(error is DioError)
      {
        showToast(state: ToastStates.ERROR,text: error.response!.data!['message'].toString());
      }

      if(kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState(error.toString()));
    });
    
  }


  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> signUpWithGoogle()async{
    try{
      GoogleSignInAccount? googleSinInAccount = await googleSignIn.signIn();
      UserRegisterByGoogle(
          firstName: googleSinInAccount!.displayName,
          lastName: googleSinInAccount!.displayName,
          email: googleSinInAccount!.email,
          id: googleSinInAccount.id,
      );
    }catch(error)
    {
      showToast(state: ToastStates.ERROR,text: error.toString());
    }

  }


  void UserRegisterByGoogle({
    required String email,
    required String id,
    String? firstName,
    String? lastName,
    String? picture = 'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
}){
    emit(RegisterByGoogleLoadingState());
    DioHelper.postData(
        url: REGISTER_GOOGLE,
        data: {
          'email' : email,
          'id' : id,
          'firstName' : firstName,
          'lastName' : lastName,
          'picture' : picture,
        }).then((value){
          loginModel = LoginModel.fromJson(value.data);
          emit(RegisterByGoogleSuccessState(loginModel));
          showToast(state: ToastStates.SUCCESS,text: 'Successful');
    }).catchError((error){
      if(error is DioError){
        showToast(state: ToastStates.ERROR, text: error.response!.data!['message'].toString());
      }

      if(kDebugMode){
        print(error.toString());
      }
      emit(RegisterByGoogleErrorState(error.toString()));
    });

}

}