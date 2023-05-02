import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/utils/attributes.dart';
import 'package:provider/provider.dart';

class chat_page extends StatefulWidget {
  const chat_page({Key? key}) : super(key: key);

  @override
  State<chat_page> createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  File? image;

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
                    child: Text("No any chats Yet"),
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
                        title:
                            Text("${contactList.allContacts[index].fullName}"),
                        subtitle:
                            Text("${contactList.allContacts[index].chat}"),
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
                                        style: TextStyle(
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
                                            onPressed: () {},
                                            icon: Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                contactList.allContacts
                                                    .removeWhere(
                                                        (element) => true);
                                              });
                                            },
                                            icon: Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Text("Cancel"))
                                    ],
                                  ),
                                );
                              });
                        },
                      );
                    },
                  ))
        : CupertinoPageScaffold(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child:  (contactList.allContacts.isEmpty)
                  ? Container(
                  alignment: Alignment.center,
                  child: Text("No Chat yets "),
                )
                    :ListView.builder(
                  itemCount: contactList.allContacts.length,
                  itemBuilder: (context, index) {
                    return CupertinoListTile(
                      padding: EdgeInsets.all(14),
                      leadingSize: 55,
                      leadingToTitle: 30,
                      leading: CircleAvatar(
                        radius: 50,
                        foregroundImage:
                        (contactList.allContacts[index].image != null)
                            ? FileImage(
                            contactList.allContacts[index].image!)
                            : null,
                      ),
                      title: Text(
                          "${contactList.allContacts[index].fullName}",
                          style: TextStyle(fontSize: 20)),
                      subtitle:
                      Text("${contactList.allContacts[index].chat}",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                height: 350,
                                width: w * 1,
                              );
                            });
                      },
                    );
                  },
                ),
              ),
            ),
          );
  }
}
