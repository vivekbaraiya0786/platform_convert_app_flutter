import 'dart:io';

class Contact{
  String fullName;
  String chat;
  String phoneNumber;
  File? image;



  Contact({required this.fullName,required this.chat,required this.phoneNumber,this.image,});
}

class Profile{
  String profliefullName;
  String profilebio;
  File? image1;

  Profile({required this.profliefullName,required this.profilebio,this.image1});
}