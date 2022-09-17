import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/layout/AppCubit.dart';
import 'package:odc/layout/states.dart';
import 'package:odc/modules/posts/new_Post.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/styles/icon_broken.dart';

import '../../layout/homeLayout/home_layout_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              "Discussion Forums",
              style: TextStyle(color: Colors.black)
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomeLayoutScreen(),
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
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
                        style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: TabBar(
                  // mouseCursor: MouseCursor.defer,
                  dragStartBehavior: DragStartBehavior.start,
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: true,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  unselectedLabelColor: HexColor('#8A8A8A'),
                  indicatorColor: HexColor('#1ABC00'),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      child: Text(
                        'All forums',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'My forums',
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
                      Center(
                        child: Text('All Posts'),
                      ),
                      SingleChildScrollView(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index) => buildPostItem(context),
                            separatorBuilder: (context,index) => const SizedBox(height: 8.0,),
                            itemCount: 10
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor('#1ABC00'),
          onPressed: () {
            navigateAndFinish(context, NewPost());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget buildPostItem(context) => Card(
  color: Colors.white,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                'https://api.time.com/wp-content/uploads/2019/08/better-smartphone-photos.jpg',
              ),
            ),
            const SizedBox(width: 15.0,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Amr Ahmed",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                    Text(
                      'a month ago',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: HexColor('#979797D6'),
                      ),
                    ),
                  ],
                ),
            ),
            const SizedBox(width: 15.0,),
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz,
                  size: 16.0,
                ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        Text(
            'Amr Ahmed',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: HexColor('#1ABC00'),
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: HexColor('#8F8D8D'),
          ),
        ),
        Padding(
            padding: const EdgeInsetsDirectional.only(top: 5),
          child: Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://api.time.com/wp-content/uploads/2019/08/better-smartphone-photos.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(
                          '0 Likes',
                        ),
                        const SizedBox(width: 50.0,),
                        Text('0 Replies'),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
