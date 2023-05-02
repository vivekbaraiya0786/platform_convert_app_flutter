import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/component/callspage.dart';
import 'package:platform_convert_app/views/component/chatpage.dart';
import 'package:platform_convert_app/views/component/personpage.dart';
import 'package:platform_convert_app/views/component/settingspage.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  File? image;
  DateTime initialDate = DateTime.now();
  DateTime? pickedDate;
  bool profileswitch = false;
  bool themeswitch = false;
  Color deepPurpple = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return (Provider.of<ChangeAppThemeProvider>(context)
                .changeAppModel
                .AppthemeMode ==
            false)
        ? GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: DefaultTabController(
              length: 4,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  bottom: TabBar(
                    indicatorColor: deepPurpple,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.person_add_alt,
                            color: deepPurpple, size: 25),
                      ),
                      Tab(
                        child: Text("CHATS",
                            style: TextStyle(color: deepPurpple, fontSize: 13)),
                      ),
                      Tab(
                        child: Text("CALLS",
                            style: TextStyle(color: deepPurpple, fontSize: 13)),
                      ),
                      Tab(
                        child: Text("SETTINGS",
                            style: TextStyle(color: deepPurpple, fontSize: 13)),
                      ),
                    ],
                  ),
                  title: const Text("Platform Converter"),
                  actions: [
                    Switch(
                      value: Provider.of<ChangeAppThemeProvider>(context)
                          .changeAppModel
                          .AppthemeMode,
                      onChanged: (value) {
                        Provider.of<ChangeAppThemeProvider>(context,
                                listen: false)
                            .changeApp();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                body: const TabBarView(
                  children: [
                    personpage(),
                    chat_page(),
                    call_page(),
                    settingpage(),
                  ],
                ),
              ),
            ),
          )
        : CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_badge_plus),
                  label: 'PERSON',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2),
                  label: 'CHATS',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone),
                  label: 'PHONE',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  label: 'SETTINGS',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: const Text("Platform Converter"),
                      trailing: CupertinoSwitch(
                        value: Provider.of<ChangeAppThemeProvider>(context)
                            .changeAppModel
                            .AppthemeMode,
                        onChanged: (value) {
                          setState(() {
                            Provider.of<ChangeAppThemeProvider>(context,
                                    listen: false)
                                .changeApp();
                          });
                        },
                      ),
                    ),
                    child: SafeArea(
                      child: IndexedStack(
                        index: index,
                        children: const [
                          personpage(),
                          chat_page(),
                          call_page(),
                          settingpage(),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}
