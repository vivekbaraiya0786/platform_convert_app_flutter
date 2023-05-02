import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/utils/attributes.dart';
import 'package:provider/provider.dart';

class call_page extends StatefulWidget {
  const call_page({Key? key}) : super(key: key);

  @override
  State<call_page> createState() => _call_pageState();
}

class _call_pageState extends State<call_page> {
  @override
  Widget build(BuildContext context) {
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
                        trailing: IconButton(
                          icon: const Icon(Icons.phone, color: Colors.green),
                          onPressed: () {},
                        ),
                      );
                    },
                  ))
        : CupertinoPageScaffold(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child:  (contactList.allContacts.isEmpty)
                  ?Container(
                  alignment: Alignment.center,
                  child: Text("No any calls yet"),
                )
                    :ListView.builder(
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
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        contactList.allContacts[index].chat,
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(CupertinoIcons.phone),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
