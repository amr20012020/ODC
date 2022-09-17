import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/shared/components/constants.dart';

class BlogDetails extends StatelessWidget {
  BlogDetails({Key? key, required this.description, required this.image}) : super(key: key);

  String? description;
  String? image;
  String? temperature;
  String? waterCapacity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(image != null && image!="")
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$baseUrl${image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if(image == '')
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          '$description',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: HexColor('#7D7B7BC7'),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: HexColor('#7D7B7BC7'),

                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: HexColor('#7D7B7BC7'),

                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: HexColor('#7D7B7BC7'),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
