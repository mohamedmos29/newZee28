import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/add_screen.dart';
import 'package:http/http.dart' as http;
import '../../Dialog.dart';
import '../Register/Register_Request.dart';
import '../Register/Register_Response.dart';
import 'api_constant.dart';
class Api_manager {
  static Future<RegisterResponse?>register(String name , String emaill, String Password,String RePassword ,String PhoneNumber,BuildContext context) async {
    Uri url = Uri.https(Api_constant.baseurl,Api_constant.register);
    DialogUtils.showLoading(context,"Loding");
    try {
      var requestbody = RegisterRequest(
          name: name,
          emaill: emaill,
          password: Password,
          rePassword: RePassword,
          phoneNumber: PhoneNumber);
      var response = await http.post(url,body: requestbody.toJson());
      if(response.statusCode==201)
        {
          DialogUtils.closeLoading(context);
          DialogUtils.showMessage(context,message: "Register Succuessfully",title: "Success",posActionName: 'Ok',
              posAction: (){Navigator.of(context).pushNamed(AddScreen.routeName);});
          return RegisterResponse.fromJson(jsonDecode(response.body));
        }
      if(response.statusCode==400)
        {
          DialogUtils.closeLoading(context);
          DialogUtils.showMessage(context,message: "register with this name already exists  ",title: "Fail",posActionName: 'Ok' );
        }
    }catch(e)
    {
      throw e;
    }
    return null;

  }
}