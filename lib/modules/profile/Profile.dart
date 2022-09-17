import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/AppCubit.dart';
import '../../layout/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../authentication/authScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 63,
                          backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Amr Ahmed',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24.88,
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: HexColor('#F3FEF1'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children:  [
                            const Image(
                              image: AssetImage('assets/images/points.png'),
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              'You have 00 points',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.88,
                                color: Colors.black,
                              ),
                            ),
                          ],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 19.88,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // navigateTo(context, const EditNameScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                                color: HexColor('#FFFFFF'),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(children:  const [
                              SizedBox(width: 10,),
                              Image(
                                image: AssetImage('assets/images/change.png'),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Change Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.88,
                                  color: Colors.black,
                                ),

                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_sharp,
                                size: 30,),
                              SizedBox(width: 10,),



                            ],),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          //navigateTo(context, const EditEmailScreen());

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                                color: HexColor('#FFFFFF'),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(children:  const [
                              SizedBox(width: 10,),
                              Image(
                                image: AssetImage('assets/images/change.png'),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Change Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.88,
                                  color: Colors.black,
                                ),

                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_sharp,
                                size: 30,),
                              SizedBox(width: 10,),



                            ],),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          signOut(context, const AuthScreen());
                        //  cubit.currentIndex=2;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            width: double.infinity,
                            height: 85,
                            decoration: BoxDecoration(
                                color: HexColor('#FFFFFF'),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Row(children:  const [
                              SizedBox(width: 10,),
                              Image(
                                image: AssetImage('assets/images/change.png'),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'LogOut',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.88,
                                  color: Colors.black,
                                ),

                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_sharp,
                                size: 30,),
                              SizedBox(width: 10,),



                            ],),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}