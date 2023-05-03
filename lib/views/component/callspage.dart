import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/utils/attributes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/provider/changethememodeprovider.dart';

class call_page extends StatefulWidget {
  const call_page({Key? key}) : super(key: key);

  @override
  State<call_page> createState() => _call_pageState();
}

class _call_pageState extends State<call_page> {
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
            body: (contactList.allContacts.isEmpty)
                ? Container(
                    alignment: Alignment.center,
                    child: const Text("No Calls history Yet"),
                  )
                : ListView.builder(
                    itemCount: contactList.allContacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          foregroundImage: (contactList
                                      .allContacts[index].image !=
                                  null)
                              ? FileImage(contactList.allContacts[index].image!)
                              : null,
                        ),
                        title: Text(contactList.allContacts[index].fullName),
                        subtitle: Text(contactList.allContacts[index].chat),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  alignment: Alignment.center,
                                  height: 350,
                                  width: w * 1,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                actionsAlignment:MainAxisAlignment.center,
                                                actionsPadding: EdgeInsets.all(14),
                                                title:
                                                    const Text("CHOOSE PHOTOS"),
                                                actions: [
                                                  GestureDetector(
                                                    onTap: () async {
                                                      ImagePicker picker =
                                                          ImagePicker();
                                                      XFile? img = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      if (img != null) {
                                                        setState(() {
                                                          contactList
                                                                  .allContacts[
                                                                      index]
                                                                  .image =
                                                              File(img.path);
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
                                                      ImagePicker picker =
                                                          ImagePicker();
                                                      XFile? img = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      if (img != null) {
                                                        setState(() {
                                                          contactList
                                                                  .allContacts[
                                                                      index]
                                                                  .image =
                                                              File(img.path);
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
                                          radius: h * 0.080,
                                          foregroundImage: contactList
                                                      .allContacts[index]
                                                      .image !=
                                                  null
                                              ? FileImage(File(contactList
                                                  .allContacts[index]
                                                  .image!
                                                  .path))
                                              : null,
                                          child: Icon(
                                              Icons.add_a_photo_outlined,
                                              size: w * 0.1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Text(
                                        "${contactList.allContacts[index].fullName}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                          "${contactList.allContacts[index].chat}"),
                                      SizedBox(
                                        height: h * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    StatefulBuilder(
                                                  builder:
                                                      (context, setState) =>
                                                          AlertDialog(
                                                            alignment: Alignment.center,
                                                            content: Container(
                                                              height: h * 0.35,
                                                              width: double.infinity,
                                                              child:  Form(
                                                                key: formKey,
                                                                child: Column(
                                                                  children: [
                                                                    const Text("Edit Details",style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 18,
                                                                    ),),
                                                                    SizedBox(
                                                                      height: h * 0.020,
                                                                    ),
                                                                    TextFormField(
                                                                      decoration: const InputDecoration(
                                                                        border: OutlineInputBorder(),
                                                                        prefixIcon: Icon(Icons.person_outline),
                                                                        hintText: "Full Name",
                                                                      ),
                                                                      controller: namecontroller1,
                                                                      // keyboardType: ,
                                                                      // textInputAction: ,
                                                                      onSaved: (newValue) {
                                                                        Fullname = newValue;
                                                                      },
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
                                                                      controller: phonecontroller1,
                                                                      keyboardType: TextInputType.number,
                                                                      // textInputAction: ,
                                                                      onSaved: (newValue) {
                                                                        PhoneNumber = newValue;
                                                                      },
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
                                                                        prefixIcon: Icon(Icons.message_outlined),
                                                                        hintText: "Chat Conversation",
                                                                      ),
                                                                      controller: chatcontroller1,
                                                                      // keyboardType: ,
                                                                      // textInputAction: ,
                                                                      onSaved: (newValue) {
                                                                        Chat = newValue;
                                                                      },
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
                                                            ),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  if (formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    setState(() {
                                                                      formKey
                                                                          .currentState!
                                                                          .save();
                                                                      contactList.allContacts[index].fullName = Fullname!;
                                                                      contactList.allContacts[index].phoneNumber = PhoneNumber!;
                                                                      contactList.allContacts[index].chat = Chat!;

                                                                      namecontroller1.clear();
                                                                      phonecontroller1.clear();
                                                                      chatcontroller1.clear();

                                                                      Navigator.of(context).pop();

                                                                    });
                                                                  };
                                                              }, child: const Text("Save"),),
                                                            ],
                                                          ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                contactList.allContacts
                                                    .removeAt(index);
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            icon: const Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: const Text("Cancel"))
                                    ],
                                  ),
                                );
                              });
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.phone, color: Colors.green),
                          onPressed: () async {
                            await launchUrl(Uri.parse(
                                "tel: +91${contactList.allContacts[index].phoneNumber}"));
                          },
                        ),
                      );
                    },
                  ))
        : CupertinoPageScaffold(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: (contactList.allContacts.isEmpty)
                    ? Container(
                        alignment: Alignment.center,
                        child: const Text("No any calls yet"),
                      )
                    : ListView.builder(
                        itemCount: contactList.allContacts.length,
                        itemBuilder: (context, index) {
                          return CupertinoListTile(
                            padding: const EdgeInsets.all(14),
                            leadingToTitle: 30,
                            leadingSize: 55,
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage:
                                  (contactList.allContacts[index].image != null)
                                      ? FileImage(
                                          contactList.allContacts[index].image!)
                                      : null,
                            ),
                            title: Text(
                              contactList.allContacts[index].fullName,
                              style: TextStyle(
                                fontSize: 20,
                                color: (Provider.of<ChangeThemeProvider>(context).changethemeModel.isDark)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            subtitle: Text(
                              contactList.allContacts[index].chat,
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing:  GestureDetector(onTap: () async{
                              await launchUrl(Uri.parse(
                                  "tel: +91${contactList.allContacts[index].phoneNumber}"));
                            },child: Icon(CupertinoIcons.phone)),
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                  cancelButton: CupertinoActionSheetAction(
                                    isDestructiveAction: true,
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        showCupertinoDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title:
                                              const Text("CHOOSE PHOTOS"),
                                              actions: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    ImagePicker picker =
                                                    ImagePicker();
                                                    XFile? img =
                                                    await picker.pickImage(
                                                        source: ImageSource
                                                            .camera);
                                                    if (img != null) {
                                                      setState(() {
                                                        contactList
                                                            .allContacts[index]
                                                            .image =
                                                            File(img.path);
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
                                                    ImagePicker picker =
                                                    ImagePicker();
                                                    XFile? img =
                                                    await picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                    if (img != null) {
                                                      setState(() {
                                                        contactList
                                                            .allContacts[index]
                                                            .image =
                                                            File(img.path);
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
                                        radius: h * 0.080,
                                        foregroundImage: contactList
                                            .allContacts[index].image !=
                                            null
                                            ? FileImage(File(contactList
                                            .allContacts[index]
                                            .image!
                                            .path))
                                            : null,
                                        child: Icon(Icons.add_a_photo_outlined,
                                            size: w * 0.1),
                                      ),
                                    ),
                                    CupertinoActionSheetAction(onPressed: () {

                                    }, child:   Text(
                                      "${contactList.allContacts[index].fullName}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),),
                                    CupertinoActionSheetAction(onPressed: () {

                                    }, child:  Text(
                                        "${contactList.allContacts[index].chat}"),),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        CupertinoButton(
                                          onPressed: () {
                                            showCupertinoModalPopup(
                                              context: context,
                                              builder: (context) =>
                                                  StatefulBuilder(
                                                    builder:
                                                        (context, setState) =>
                                                        CupertinoAlertDialog(
                                                          content: Container(
                                                            height: h * 0.35,
                                                            width: double.infinity,
                                                            child: Form(
                                                              key: formKey,
                                                              child: Column(
                                                                children: [
                                                                  const Text(
                                                                    "Edit Details",
                                                                    style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: h * 0.020,
                                                                  ),
                                                                  CupertinoTextFormFieldRow(
                                                                    prefix: const Icon(CupertinoIcons.person),
                                                                    placeholder: "Full Name",
                                                                    controller: namecontroller1,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      border: Border.all(
                                                                        color: Colors.grey,
                                                                        width: 1,
                                                                      ),
                                                                    ),
                                                                    onSaved: (newValue) {
                                                                      Fullname = newValue;
                                                                    },
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
                                                                    height: h * 0.020,
                                                                  ),

                                                                  CupertinoTextFormFieldRow(
                                                                    prefix: const Icon(CupertinoIcons.phone),
                                                                    placeholder: "Phone Number",
                                                                    controller: phonecontroller1,
                                                                    keyboardType: TextInputType.number,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      border: Border.all(
                                                                        color: Colors.grey,
                                                                        width: 1,
                                                                      ),
                                                                    ),
                                                                    onSaved: (newValue) {
                                                                      PhoneNumber = newValue;
                                                                    },
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
                                                                    height: h * 0.020,
                                                                  ),
                                                                  CupertinoTextFormFieldRow(
                                                                    prefix: const Icon(CupertinoIcons.chat_bubble_text),
                                                                    placeholder: "Chat Conversation",
                                                                    controller: chatcontroller1,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      border: Border.all(
                                                                        color: Colors.grey,
                                                                        width: 1,
                                                                      ),
                                                                    ),
                                                                    onSaved: (newValue) {
                                                                      Chat = newValue;
                                                                    },
                                                                    validator: (value) {
                                                                      if (value!.isEmpty) {
                                                                        return "Please Enter Conversation";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    // controller: ,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          actions: [
                                                            CupertinoButton(
                                                              onPressed: () {
                                                                if (formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  setState(() {
                                                                    formKey
                                                                        .currentState!
                                                                        .save();
                                                                    contactList.allContacts[index].fullName = Fullname!;
                                                                    contactList.allContacts[index].phoneNumber = PhoneNumber!;
                                                                    contactList.allContacts[index].chat = Chat!;
                                                            namecontroller1
                                                                .clear();
                                                            phonecontroller1
                                                                .clear();
                                                            chatcontroller1
                                                                .clear();

                                                            Navigator.of(context).pop();

                                                                  });
                                                                };
                                                              },
                                                              child:
                                                              const Text("Save"),
                                                            ),
                                                          ],
                                                        ),
                                                  ),
                                            );
                                          },
                                          child: Icon(CupertinoIcons.pen),
                                        ),
                                        CupertinoButton(
                                          onPressed: () {
                                            setState(() {
                                              contactList.allContacts
                                                  .removeAt(index);
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ),
          );
  }
}
