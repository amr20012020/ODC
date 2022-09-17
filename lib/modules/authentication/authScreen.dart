import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/homeLayout/home_layout_screen.dart';
import 'package:odc/modules/authentication/cubit/cubit.dart';
import 'package:odc/shared/components/constants.dart';
import 'package:odc/shared/network/local/cache_helper.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/icon_broken.dart';
import '../address/addressScreen.dart';
import 'cubit/states.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var emailSignUpController = TextEditingController();
    var passwordSignUpController = TextEditingController();
    var confirmPasswordSignUpController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return DefaultTabController(
              length: 2,
              initialIndex: 1,
              child: Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/logo.png'),
                                      height: 150,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: TabBar(
                                        labelColor: HexColor('#1ABC00'),
                                        unselectedLabelColor:
                                            HexColor('#8A8A8A'),
                                        indicatorColor: HexColor('#1ABC00'),
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        tabs: const [
                                          Tab(
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              'SignUp',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 500,
                                      child: TabBarView(
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                defaultFormField(
                                                  controller: emailController,
                                                  type: TextInputType
                                                      .emailAddress,
                                                  label: "Email address",
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'email must be not empty';
                                                    } else if (!value
                                                            .toString()
                                                            .contains('@') ||
                                                        !value
                                                            .toString()
                                                            .contains('.com')) {
                                                      return 'ex: example@mail.com';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefixIcon:
                                                      IconBroken.Add_User,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                defaultFormField(
                                                  function: () {
                                                     AuthCubit.get(context).changePasswordVisibility();
                                                  },
                                                  controller:
                                                      passwordController,
                                                  type: TextInputType
                                                      .visiblePassword,
                                                  label: "Password",
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "Password must not be empty";
                                                    }
                                                  },
                                                  prefixIcon: IconBroken.Unlock,
                                                  isPassword: cubit.isPassword,
                                                  suffixIcon: cubit.suffix,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                     Checkbox(
                                                       value: cubit.LoginisChecked,
                                                    onChanged: (value){
                                                           cubit.loginRememberMe(value);
                                                       },
                                                    ),
                                                    const Text(
                                                      'Remember me?',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Conditional.single(
                                                  context: context,
                                                  conditionBuilder: (BuildContext
                                                          context) => state is! RegisterLoadingState,
                                                  widgetBuilder: (BuildContext context) => defaultButton(
                                                    text: 'Login',
                                                    function: () {
                                                       if (formKey.currentState!.validate())
                                                       {
                                                         cubit.userLogin(email: emailController.text,password:  passwordController.text);
                                                    }
                                                    },
                                                    background:
                                                        HexColor('#1ABC00'),
                                                    radius: 6,
                                                  ),
                                                  fallbackBuilder: (BuildContext
                                                          context) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      // navigateTo(context,  const ForgetPasswordScreen());
                                                    },
                                                    child: const Text(
                                                      'Forgotten Password?',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 1.0,
                                                        color:
                                                            HexColor('#979797'),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child: Text(
                                                        'or continue with',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 1.0,
                                                        color:
                                                            HexColor('#979797'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                         cubit.signUpWithGoogle();
                                                      },
                                                      child: const Image(
                                                        image: AssetImage(
                                                            'assets/images/Google.png'),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Image(
                                                        image: AssetImage(
                                                            'assets/images/Facebook.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 50,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: defaultFormField(
                                                          label: 'First Name',
                                                          controller:
                                                              firstNameController,
                                                          type: TextInputType
                                                              .name,
                                                          validator:
                                                              (String? value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'First name must not be empty';
                                                            }
                                                            if (value.length <
                                                                3) {
                                                              return 'Should be more than 3 Characters';
                                                            }
                                                          }),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: defaultFormField(
                                                          controller:
                                                              lastNameController,
                                                          label: 'Last Name',
                                                          type: TextInputType
                                                              .name,
                                                          validator:
                                                              (String? value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'First name must not be empty';
                                                            }
                                                            if (value.length <
                                                                3) {
                                                              return 'Should be more than 3 Characters';
                                                            }
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                defaultFormField(
                                                  //fontColor: Cubit.get(context).isDark?Colors.white:Colors.black,
                                                  controller:
                                                      emailSignUpController,
                                                  type: TextInputType
                                                      .emailAddress,
                                                  label: "Email address",
                                                  validator: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return 'email must be not empty';
                                                    } else if (!value
                                                            .toString()
                                                            .contains('@') ||
                                                        !value
                                                            .toString()
                                                            .contains('.com')) {
                                                      return 'ex: example@mail.com';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefixIcon:
                                                      IconBroken.Add_User,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                defaultFormField(
                                                  //fontColor:Cubit.get(context).isDark?Colors.white:Colors.black,

                                                  function: () {
                                                    AuthCubit.get(context)
                                                  .changePasswordVisibility2();
                                                  },
                                                  controller:
                                                      passwordSignUpController,
                                                  type: TextInputType
                                                      .visiblePassword,
                                                  label: "Password",
                                                  validator: (value) {
                                                    RegExp regEx = RegExp(
                                                        r"(?=.*[a-z])(?=.*[A-Z])\w+");
                                                    if (value.isEmpty) {
                                                      return "Password must not be empty";
                                                    }
                                                    if (value !=
                                                        confirmPasswordSignUpController
                                                            .text) {
                                                      return "Password must be same";
                                                    } else if (value.length <
                                                        8) {
                                                      return 'Should be more than 8 Characters';
                                                    } else if (!value
                                                        .toString()
                                                        .contains(regEx)) {
                                                      return 'Use Numbers and Capital and Small Characters at least 1';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefixIcon: IconBroken.Unlock,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                defaultFormField(
                                                  //fontColor:Cubit.get(context).isDark?Colors.white:Colors.black,

                                                  function: () {
                                                     AuthCubit.get(context)
                                                  .changePasswordVisibility2();
                                                  },
                                                  controller:
                                                      confirmPasswordSignUpController,
                                                  type: TextInputType
                                                      .visiblePassword,
                                                  label: "Confirm Password",
                                                  validator: (value) {
                                                    RegExp regEx = RegExp(
                                                        r"(?=.*[a-z])(?=.*[A-Z])\w+");
                                                    if (value.isEmpty) {
                                                      return "Password must not be empty";
                                                    } else if (value !=
                                                        passwordSignUpController
                                                            .text) {
                                                      return "Password must be same";
                                                    } else if (value.length <
                                                        8) {
                                                      return 'Should be more than 8 Characters';
                                                    } else if (!value
                                                        .toString()
                                                        .contains(regEx)) {
                                                      return 'Use Numbers and Capital and Small Characters at least 1';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                    prefixIcon: IconBroken.Unlock,
                                                    isPassword: cubit.isPassword2,
                                                    suffixIcon: cubit.suffix2,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      value:
                                                          false, //cubit.registerIsChecked,
                                                      onChanged: (value) {
                                                         cubit.registerRememberMe(value);
                                                      },
                                                    ),
                                                    const Text(
                                                      'Remember me?',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Conditional.single(
                                                  context: context,
                                                  conditionBuilder: (BuildContext
                                                          context) =>
                                                      state
                                                          is! RegisterLoadingState,
                                                  widgetBuilder:
                                                      (BuildContext context) =>
                                                          defaultButton(
                                                    text: 'Sign Up',
                                                    function: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        cubit.UserRegister(
                                                            email: emailSignUpController.text,
                                                            password: passwordSignUpController.text,
                                                            lastName: lastNameController.text,
                                                            firstName: firstNameController.text);
                                                      }
                                                    },
                                                    background:
                                                        HexColor('#1ABC00'),
                                                    radius: 6,
                                                  ),
                                                  fallbackBuilder: (BuildContext
                                                          context) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                ),
                                                const SizedBox(
                                                  height: 25,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 1.0,
                                                        color:
                                                            HexColor('#979797'),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child: Text(
                                                        'or continue with',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 1.0,
                                                        color:
                                                            HexColor('#979797'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                         cubit.signUpWithGoogle();
                                                      },
                                                      child: const Image(
                                                        image: AssetImage(
                                                            'assets/images/Google.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/loginUp.png',
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/loginDown.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if(state is LoginSuccessState){
              if(state.loginModel.type == 'Success'){
                if(kDebugMode) {
                  print(state.loginModel.message);
                }
                showToast(state: ToastStates.SUCCESS,text: state.loginModel.message.toString());
                if(state.loginModel.data!.user!.address!= null){
                  navigateAndFinish(context, const HomeLayoutScreen());
                }else{
                 // AuthCubit.get(context).determinePosition();
                  navigateAndFinish(context, AddressScreen());
                }

                CacheHelper.saveData(
                    key: 'token',
                    value: state.loginModel.data!.accessToken,
                ).then((value) {
                  token = state.loginModel.data!.accessToken!;
                });
                if(AuthCubit.get(context).LoginisChecked){
                  CacheHelper.saveData(
                      key: 'rememberMe',
                      value: true,
                  ).then((value){
                    rememberMe = true;
                  });
                }
              }else{
                if(kDebugMode){
                  print(state.loginModel.message);
                }
                showToast(
                    state: ToastStates.ERROR,text: state.loginModel.message
                );
              }
            }
            if(state is RegisterSuccessState){
              if(state.loginModel.type == 'Success'){
                showToast(state: ToastStates.SUCCESS,text: state.loginModel.message);
               // AuthCubit.get(context).determinePostision();
                navigateAndFinish(context, AddressScreen());
                CacheHelper.saveData(
                    key: 'token',
                    value: state.loginModel.data!.accessToken)
                    .then((value){
                      token = state.loginModel.data!.accessToken!;
                });
                if(AuthCubit.get(context).RegisterisChecked){
                  CacheHelper.saveData(
                      key: 'rememberMe',
                      value: true
                  ).then((value) {
                    rememberMe = true;
                  });
                }
              } else{
                if(kDebugMode){
                  print(state.loginModel.message);
                }
                showToast(state: ToastStates.ERROR,text: state.loginModel.message);
              }
            }
          }),
    );
  }
}
