import 'package:flutter/cupertino.dart';
import 'package:platform_convert_app/modals/contact_model.dart';

class contactList{
  static List<Contact> allContacts = [];
}


//controllers

TextEditingController namecontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController chatcontroller = TextEditingController();

TextEditingController profilenamecontroller = TextEditingController(text: profliename);
TextEditingController profilebiocontroller = TextEditingController(text: profilebio);

String? profliename;
String? profilebio;

GlobalKey<FormState> formKey = GlobalKey<FormState>();
GlobalKey<FormState> formKey1 = GlobalKey<FormState>();