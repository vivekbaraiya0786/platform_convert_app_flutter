import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/modals/contact_model.dart';
import 'package:platform_convert_app/views/utils/attributes.dart';
import 'package:provider/provider.dart';

class personpage extends StatefulWidget {
  const personpage({Key? key}) : super(key: key);

  @override
  State<personpage> createState() => _personpageState();
}

class _personpageState extends State<personpage> {
  File? image;
  bool profileswitch = false;
  bool themeswitch = false;
  int i = 0;
  DateTime initialdatevalue = DateTime.now();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return (Provider.of<ChangeAppThemeProvider>(context)
                .changeAppModel
                .AppthemeMode ==
            false)
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text("Choose Photo"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  ImagePicker picker =
                                                      ImagePicker();
                                                  XFile? img =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (img != null) {
                                                    setState(() {
                                                      image = File(img.path);
                                                    });
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                icon: const Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 80),
                                              ),
                                              const Text("Camera")
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  ImagePicker picker =
                                                      ImagePicker();
                                                  XFile? img =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (img != null) {
                                                    setState(() {
                                                      image = File(img.path);
                                                    });
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                                icon: const Icon(
                                                    Icons
                                                        .photo_camera_back_outlined,
                                                    size: 80),
                                              ),
                                              const Text("Gallery")
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          });
                        },
                        child: CircleAvatar(
                          radius: h * 0.085,
                          foregroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child:
                              Icon(Icons.add_a_photo_outlined, size: w * 0.1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                            hintText: "Full Name",
                          ),
                          controller: namecontroller,
                          // keyboardType: ,
                          // textInputAction: ,
                          // onSaved: ,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your full Name";
                            } else {
                              null;
                            }
                          },
                        ),
                        SizedBox(
                          height: h * 0.020,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Phone Number",
                          ),
                          controller: phonecontroller,
                          // keyboardType: ,
                          // textInputAction: ,
                          // onSaved: ,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Phone Number";
                            } else {
                              null;
                            }
                          },
                        ),
                        SizedBox(
                          height: h * 0.020,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.message_rounded),
                            hintText: "Chat Conversation",
                          ),
                          controller: chatcontroller,
                          // keyboardType: ,
                          // textInputAction: ,
                          // onSaved: ,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Phone Number";
                            } else {
                              null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          pickedDate = await showDatePicker(
                            context: context,
                            initialDate: initialdatevalue,
                            firstDate: DateTime(1901),
                            lastDate: DateTime(2099),
                          );
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: (pickedDate == null)
                              ? Text(
                                  "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}")
                              : Text(
                                  "${pickedDate!.day} / ${pickedDate!.month} / ${pickedDate!.year} "))
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.watch_later_rounded),
                      ),
                      const Text("Pick Time"),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                        }
                        String name = namecontroller.text;
                        String phone = phonecontroller.text;
                        String chat = chatcontroller.text;

                        Contact c1 = Contact(
                            fullName: name,
                            chat: chat,
                            phoneNumber: phone,
                            image: image);

                        contactList.allContacts.add(c1);
                        namecontroller.clear();
                        phonecontroller.clear();
                        chatcontroller.clear();
                      });
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          )
        : CupertinoPageScaffold(
            child: SafeArea(
              child: Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text("CHOOSE PHOTOS"),
                                actions: [
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.camera);
                                      if (img != null) {
                                        setState(() {
                                          image = File(img.path);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Icon(
                                      CupertinoIcons.camera,
                                      size: 75,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? img = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      if (img != null) {
                                        setState(() {
                                          image = File(img.path);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Icon(
                                      CupertinoIcons.photo,
                                      size: 75,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: h * 0.085,
                          foregroundImage: image != null
                              ? FileImage(File(image!.path))
                              : null,
                          child:
                              Icon(Icons.add_a_photo_outlined, size: w * 0.1),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.030,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.person),
                        placeholder: "Full Name",
                        controller: namecontroller,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Full Name";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.010,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.phone),
                        placeholder: "Phone Number",
                        controller: phonecontroller,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Phone Number";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.010,
                      ),
                      CupertinoTextFormFieldRow(
                        prefix: const Icon(CupertinoIcons.chat_bubble_text),
                        placeholder: "Chat Conversation",
                        controller: chatcontroller,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Conversation";
                          } else {
                            return null;
                          }
                        },
                        // controller: ,
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      CupertinoButton.filled(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          right: 30,
                          left: 30,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        child: const Text("SAVE"),
                        onPressed: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                            String name = namecontroller.text;
                            String phone = phonecontroller.text;
                            String chat = chatcontroller.text;

                            Contact c1 = Contact(
                                fullName: name,
                                chat: chat,
                                phoneNumber: phone,
                                image: image);

                            contactList.allContacts.add(c1);
                            namecontroller.clear();
                            phonecontroller.clear();
                            chatcontroller.clear();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
