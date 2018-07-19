import 'package:flutter/material.dart';

class Bmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }

}

class BmiState extends State<Bmi>{
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double result =0.0;
  String result_reading="";
  String _final_result="";
  void calculate_bmi(){
    
    setState(() {
 
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty||age>=0)&&(_heightController.text.isNotEmpty||height>=0)&&(_weightController.text.isNotEmpty||weight>=0))
          result = weight/(height*height);
          if(double.parse(result.toStringAsFixed(1))<18.5){
            result_reading="UnderWeight";
            print(result_reading);
          }
          else if(double.parse(result.toStringAsFixed(1))>18.5&&result<25){
            result_reading="Great Shape";
            print(result_reading);
          }
          else if(double.parse(result.toStringAsFixed(1))>25&&result<30){
            result_reading="OverWeight";
            print(result_reading);
          }
          else if(double.parse(result.toStringAsFixed(1))>=30){
            result_reading="Obese";
            print(result_reading);
          }else{
            result=0.0;
          }
        });

        _final_result="Your BMI: ${result.toStringAsFixed(1)}";

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',height: 85.0,width: 75.0,),

          new Container(
            margin: const EdgeInsets.all(3.0),
            height: 345.0,
            width: 290.0,
            color: Colors.grey.shade200,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Age',
                    hintText: 'e.g: 34',
                    icon: Icon(Icons.person_outline)
                  ),
                ),

                 new TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Height in Meter',
                    hintText: 'e.g: 6.5',
                    icon: Icon(Icons.insert_chart)
                  ),
                 ),

                 new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Weight in KG',
                    hintText: 'e.g: 60',
                    icon: Icon(Icons.line_weight)
                  ),
                 ),

                  new Padding(padding: new EdgeInsets.all(30.6)),

                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: calculate_bmi,
                      color: Colors.pinkAccent,
                      child: new Text('Calculate'),
                      textColor: Colors.white 
                    ),
                  )
              ],
            ),
          ),

          new Padding(padding: new EdgeInsets.all(10.6)),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("$_final_result",style: new TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,fontSize: 19.9)),

              new Padding(padding: new EdgeInsets.all(5.0)),

              new Text("$result_reading",style: new TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontSize: 19.9)),             
            ],
          ),
          ],
        ),
      ),

    );
  }

}