import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switch1 = false;
  bool switch2 = false;

  String dropDownbutton1 = "English";
  var languages = ["English", "Malayalam", "Tamil", "hindi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.account_circle,
                      size: 25,
                    ),
                    title: Text("Account"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.privacy_tip,
                      size: 25,
                    ),
                    title: Text("Privacy Policy"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.account_circle,
                      size: 25,
                    ),
                    title: Text("Notifications"),
                    trailing: Switch(
                      activeColor: Colors.black,
                      value: switch1,
                      onChanged: (value) {
                        setState(() {
                          switch1 = !switch1;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.light_mode_outlined,
                      size: 25,
                    ),
                    title: Text("Dark/Light"),
                    trailing: Switch(
                      activeColor: Colors.black,
                      value: switch2,
                      onChanged: (value) {
                        setState(() {
                          switch2 = !switch2;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.language,
                        size: 25,
                      ),
                      title: Text("Language"),
                      trailing: DropdownButton(
                        value: dropDownbutton1,
                        items: languages.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownbutton1 = newValue!;
                          });
                        },
                      )),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.password,
                      size: 25,
                    ),
                    title: Text("Change Password"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    title: Text("Delete Account"),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.logout,
                      size: 25,
                    ),
                    title: Text("Log Out"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
