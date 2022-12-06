import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/model.dart';
import 'package:getx/secondpage.dart';

/////////////
void main()
{
  //1.getmaterialApp
  runApp(GetMaterialApp(home: demo(),));
}
class getmethod extends StatelessWidget {

  //2.var,method,controller access in model
  model m= Get.put(model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Method"),),
      body: Column(
        children: [
          TextField(controller: m.t1,),
          TextField(controller: m.t2,),
          ElevatedButton(onPressed: () {
            m.total(m.t1.text,m.t2.text);
          }, child: Text("Sum")),
         Obx(() =>  Text("Sum=${m.sum}")),
          ElevatedButton(onPressed: () {
            Get.to(secondpage());
          }, child: Text("Second page"))
        ],
      ),
    );
  }
}


class demo extends StatelessWidget {

  //2.var,method,controller access in model
  model m= Get.put(model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Method"),),
      body: Column(
        children: [
         Obx(() =>  Slider(onChanged: (value) {
           m.change(value);
         },
           min: 1,
           max: 10,
           value: m.v.value,
         )),
          Obx(() =>  Text("value=${m.v}")),

        ],
      ),
    );
  }
}

