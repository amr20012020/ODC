import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:odc/shared/components/components.dart';
import 'package:odc/shared/styles/icon_broken.dart';

import '../../layout/homeLayout/home_layout_screen.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create New Post", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 140.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROSzPOy8z815m-KUZ-JiFtByrYO2ugAkilZA&usqp=CAU'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: CircleAvatar(
                       radius: 20,
                       child: IconButton(
                         onPressed: (){},
                         icon: Icon(
                           Icons.close,
                           size: 16,
                         ),
                       ),
                     ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconBroken.Plus,
                          color: HexColor('#1ABC00'),
                        ),
                        SizedBox(height: 10,),
                        Text(
                            'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: HexColor('#1ABC00'),
                          ),
                            ),
                      ],
                    ),
                  ),
                  width: 136,
                  height: 136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: HexColor('#1ABC00'),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                defaultFormField(
                    controller: titleController,
                    type: TextInputType.text,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Title must not be empty';
                      }
                    }
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Description must not be empty';
                    }
                  },
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20,),
                defaultButton(
                  background: HexColor('#1ABC00'),
                    radius: 10,
                    text: 'Post',
                    function: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
