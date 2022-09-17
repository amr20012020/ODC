import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/models/blogs_model/Data.dart';
import 'package:odc/models/plants_model/PlantsModel.dart';

import 'package:odc/models/products_model/Data.dart';
import 'package:odc/models/seeds_model/Data.dart';
import 'package:odc/models/tools_model/Data.dart';
import 'package:odc/modules/blog_details/blog_details.dart';
import 'package:odc/modules/cart/CartScreen.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/components/constants.dart';
import 'package:odc/shared/styles/icon_broken.dart';
import '../../models/plants_model/Data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                cubit.plantsModel?.data != null &&
                cubit.productsModel?.data != null &&
                cubit.toolsModel?.data != null &&
                cubit.seedsModel?.data != null,
            widgetBuilder: (BuildContext context) => DefaultTabController(
                  length: 5,
                  initialIndex: 0,
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Container(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/logo.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F5F5F5'),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Icon(IconBroken.Search),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Search',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  navigateTo(context, CartScreen());
                                },
                                child: Container(
                                  width: 51,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('#1ABC00'),
                                  ),
                                  child: const Icon(
                                    IconBroken.Buy,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: TabBar(
                             // mouseCursor: MouseCursor.defer,
                              dragStartBehavior: DragStartBehavior.start,
                              automaticIndicatorColorAdjustment: true,
                              isScrollable: true,
                              labelColor: HexColor('#1ABC00'),
                              unselectedLabelColor: HexColor('#8A8A8A'),
                              indicatorColor: HexColor('#1ABC00'),
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Plants',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Seeds',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Tools',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Blogs',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GridView.count(
                                            mainAxisSpacing: 1,
                                            crossAxisSpacing: 1,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            childAspectRatio: 1 / 1.58,
                                            crossAxisCount: 2,
                                            children:List.generate(
                                                cubit.productsModel!.data!.length,
                                                    (index) => buildProductItem(cubit.productsModel!.data![index])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GridView.count(
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 1,
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          childAspectRatio: 1 / 1.58,
                                          crossAxisCount: 2,
                                          children:List.generate(
                                              cubit.plantsModel!.data!.length,
                                                  (index) => buildPlantsItem(
                                                     cubit.plantsModel!.data![index]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GridView.count(
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 1,
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          childAspectRatio: 1 / 1.58,
                                          crossAxisCount: 2,
                                          children:List.generate(
                                              cubit.seedsModel!.data!.length,
                                                  (index) => buildSeedsItem(cubit.seedsModel!.data![index])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GridView.count(
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 1,
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          childAspectRatio: 1 / 1.58,
                                          crossAxisCount: 2,
                                          children:List.generate(
                                              cubit.toolsModel!.data!.length,
                                                  (index) => buildToolsItem(cubit.toolsModel!.data![index])),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: cubit.plantsModel!.data!.length,
                                    itemBuilder: (BuildContext context, int index) => buildBlogsItem(cubit.plantsModel!.data![index], context, index),
                                    separatorBuilder: (BuildContext context, int index) => myDivider(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            fallbackBuilder: (BuildContext context) => const Center(child: CircularProgressIndicator(),));
      },
    );
  }
}


buildProductItem(ProductData model) => Column(
  children:
  [
    SizedBox(
      height:45,
    ),
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                spreadRadius: 10,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              if(model.imageUrl != null && model.imageUrl != " ")
                Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(
                            '${baseUrl}${model.imageUrl}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              if(model.imageUrl == '')
                Expanded(child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                        ),
                      ),
                )),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3,),
              Text(
                "${model.price} EGP",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Positioned(
                  top: 40,
                  left: 90,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12,),
                      const Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 12,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],

                  ),
              ),
              const SizedBox(height: 5,),
              defaultButton(
                  width: 150,
                  radius: 20,
                  background: HexColor('#1ABC00'),
                  text: "Add To Cart",
                  function: (){},
              ),
            ],
          ),
        ),
      ],
    ),
  ],

);


buildPlantsItem(Data model) => Column(
  children: [
    SizedBox(height: 45,),
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                spreadRadius: 10,
                color: Colors.grey,
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
               if(model.imageUrl != null && model.imageUrl != " ")
                 Expanded(
                     child: Container(
                       width: 150,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(25),
                         image: DecorationImage(
                           image: NetworkImage(
                             '${baseUrl}${model.imageUrl}',
                           ),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                 ),
              if(model.imageUrl == '')
                Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                        ),
                      ),
                    )),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3,),
              Positioned(
                top: 40,
                left: 90,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              defaultButton(
                  width: 150,
                  text: "Add To Cart",
                  radius: 20,
                  function: () {},
                  background: HexColor("#1ABC00"),
              ),
            ],
          ),
        ),

      ],
    ),
  ],
);


buildSeedsItem(SeedsData model) => Column(
  children: [
    SizedBox(height: 45,),
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 10,
                  color: Colors.grey,
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              if(model.imageUrl != null && model.imageUrl != " ")
                Expanded(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${baseUrl}${model.imageUrl}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if(model.imageUrl == '')
                Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                        ),
                      ),
                    )),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3,),
              Positioned(
                top: 40,
                left: 90,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              defaultButton(
                width: 150,
                text: "Add To Cart",
                radius: 20,
                function: () {},
                background: HexColor("#1ABC00"),
              ),
            ],
          ),
        ),

      ],
    ),
  ],
);


buildToolsItem(ToolsData model) => Column(
  children: [
    SizedBox(height: 45,),
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 10,
                  color: Colors.grey,
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              if(model.imageUrl != null && model.imageUrl != " ")
                Expanded(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${baseUrl}${model.imageUrl}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if(model.imageUrl == '')
                Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                        ),
                      ),
                    )),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3,),
              Positioned(
                top: 40,
                left: 90,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              defaultButton(
                width: 150,
                text: "Add To Cart",
                radius: 20,
                function: () {},
                background: HexColor("#1ABC00"),
              ),
            ],
          ),
        ),

      ],
    ),
  ],
);

/*buildBlogsItem(Data model,context,index) => Column(
  children: [
    SizedBox(height: 45,),
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 230,
          width: 150,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 10,
                  color: Colors.grey,
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              if(model.imageUrl != null && model.imageUrl != " ")
                Expanded(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${baseUrl}${model.imageUrl}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if(model.imageUrl == '')
                Expanded(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/plant.png'),
                        ),
                      ),
                    )
                ),
              Text(
                model.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3,),
              Positioned(
                top: 40,
                left: 90,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15,),
              defaultButton(
                width: 150,
                text: "Add To Cart",
                radius: 20,
                function: () {},
                background: HexColor("#1ABC00"),
              ),
            ],
          ),
        ),

      ],
    ),
  ],
);*/

buildBlogsItem(Data model, context,index) => InkWell(
  onTap: (){
    navigateTo(context, BlogDetails(image: model.imageUrl, description: model.description,));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        if(model.imageUrl != null && model.imageUrl != "")
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$baseUrl${model.imageUrl}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        if(model.imageUrl == '')
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: ExactAssetImage('assets/images/plant.png'),
                  fit: BoxFit.cover,
              ),
            ),
          ),
        const SizedBox(width: 20,),
        Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 days ago',
                    style: TextStyle(
                      color: HexColor('#1ABC00'),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                      child: Text(
                        '${model.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                  ),
                  Expanded(
                    child: Text(
                      '${model.temperature} C',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${model.waterCapacity} %',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${model.sunLight} %',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    'leaf, in botany, any usually',
                    style: TextStyle(
                      color: HexColor('##7D7B7BC7'),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
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
