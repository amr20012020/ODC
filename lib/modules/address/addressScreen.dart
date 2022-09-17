import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/homeLayout/home_layout_screen.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/components/constants.dart';
import 'package:odc/shared/styles/icon_broken.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/logo.png'),
                          height: 150,
                        ),
                        const Text(
                          'Get your Location',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Enter Your Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Row(
                          children: [
                            Expanded(
                              child: defaultFormField(
                                  controller: addressController,
                                  type: TextInputType.name,
                                  validator: (String? value){
                                    if(value!.isEmpty){
                                      return 'Address must not be empty';
                                    } else{
                                      return null;
                                    }
                                  }
                              ),
                            ),
                            const SizedBox(width: 10,),
                            IconButton(
                              onPressed: ()
                              {
                                cubit.getCurrentLocation();
                                cubit.getAddress(cubit.position);
                              },
                              icon: Icon(IconBroken.Location),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Conditional.single(
                            context: context,
                            conditionBuilder: (BuildContext context) => state is !AppLoadingClaimFreeSeedsState,
                            widgetBuilder: (BuildContext context) => defaultButton(
                                text: 'Send', 
                                function: ()
                                {
                                  if(formKey.currentState!.validate())
                                    {
                                     // cubit.claimFreeSeeds(address: addressController.text,token: token!);
                                    }
                                }),
                            fallbackBuilder: (BuildContext context) =>
                            const Center(child: CircularProgressIndicator(),),
                        ),
                        const SizedBox(height: 20,),
                        defaultButton(
                            textColor: Colors.white,
                            text: 'Save For Later', 
                            function: (){
                              navigateAndFinish(context, const HomeLayoutScreen());
                            },
                          radius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }, 
        listener: (context,state)
        {
          if(state is AppSuccessGetLocationState)
            {
             if(AppCubit.get(context).address.toString() != 'null')
               {
                 addressController.text = AppCubit.get(context).address.toString();
               }
            }
          if(state is AppSuccessClaimFreeSeedsState)
            {
              if(state.message == 'Success')
                {
                  navigateAndFinish(context, const HomeLayoutScreen());
                }
            }
          },
    );
  }
}
