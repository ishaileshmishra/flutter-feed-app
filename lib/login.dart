import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:healthnest/home.dart';

class HealthNestLogin extends StatefulWidget {
  @override
  _HealthNestLoginState createState() => _HealthNestLoginState();
}

class _HealthNestLoginState extends State<HealthNestLogin> {
  Country _selectedCountry;
  final controller = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String consumerMobileNumber;
  //bool _isButtonDisabled;

  @override
  void initState() {
    //_isButtonDisabled = false;
    _selectedCountry = Country.IN;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidate: _validate,
      child: formUI(),
    );
  }

  Widget formUI() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 150.0, left: 16, right: 16, bottom: 16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/img/doctor.png',
                          width: 80, height: 80, color: Colors.teal)),
                  SizedBox(height: 20),
                  Container(
                    //alignment: Alignment.bottomLeft,

                    child: const Text(
                      'Welcome to\nHealthNest',
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 40),
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
                              _selectedCountry = country;
                            });
                          },
                          selectedCountry: _selectedCountry,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Enter phone number',
                              suffixIcon: Icon(CupertinoIcons.phone)),
                          validator: _validateMobile,
                          controller: controller,
                          onSaved: (String phoneNumber) {
                            consumerMobileNumber = phoneNumber;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                      width: 350,
                      child: Text(
                        'We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      )),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      //onPressed: _isButtonDisabled ? null : () {_sendToServer();},
                      onPressed: _sendToServer,
                      child: Text('Send OTP', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold)),
                      //color: Theme.of(context).accentColor,
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }

    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print("Mobile $consumerMobileNumber");
      print('Country ${_selectedCountry.name}');

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
