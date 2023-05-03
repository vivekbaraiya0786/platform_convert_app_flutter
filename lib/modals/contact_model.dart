import 'dart:io';

import 'package:flutter/material.dart';

class Contact{
  String fullName;
  String chat;
  String phoneNumber;
  File? image;

  DateTime? PickedDate;
  TimeOfDay? time;



  Contact({required this.fullName,required this.chat,required this.phoneNumber,this.image,this.PickedDate,this.time});
}

