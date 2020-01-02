import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

void main() => runApp(MaterialApp(
      title: 'HealthNest',
      theme: ThemeData(primaryColor: Colors.grey, accentColor: Colors.teal),
      home: HealthNest(),
    ));

class HealthNest extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HealthNestState createState() => _HealthNestState();
}

class _HealthNestState extends State<HealthNest> {

  Country _selected;
  final controller = TextEditingController();
  String consumerMobileNumber;


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  void initState() {
    consumerMobileNumber = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () { FocusScope.of(context).requestFocus(new FocusNode());},
        //child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      width: 300,
                      child: const Text(
                        'Welcome to HealthNest',
                        style: TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),


              SizedBox(height: 20),


              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),

                  child: Column(
                    children: <Widget>[

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CountryPicker(
                              showDialingCode: true,
                              showName: false,
                              showCurrencyISO: false,
                              onChanged: (Country country) {
                                setState(() {
                                  _selected = country;
                                  debugPrint('$country');
                                });
                              },
                              selectedCountry: _selected,
                            ),
                          ),

                          SizedBox(width: 20),

                          Expanded(
                            flex: 2,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration( hintText: 'Enter Phone Number'),
                              controller: controller,
                              onChanged: (phoneNumber){
                                consumerMobileNumber = phoneNumber;
                                debugPrint(phoneNumber);
                              },
                            ),
                          )

                        ],
                      ),


                      SizedBox(height: 50),

                      Container(
                        width: 350,
                        child: Text('We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey
                        ),)
                      ),

                      SizedBox(height: 50),

                      Container(
                        padding: EdgeInsets.all(18),
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 40),
                        child: RaisedButton(
                          onPressed: (){
                            debugPrint('Got Field Input:: $consumerMobileNumber');
                          },
                          child: Text('Send OTP', style: TextStyle(fontSize: 21),),
                          padding: EdgeInsets.all(12),
                          elevation: 3,
                        ),
                      ),



                    ],
                  ),

                ),
              ),





            ],
          ),
        //),
      ),
    );
  }
}
