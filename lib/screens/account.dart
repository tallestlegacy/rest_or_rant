import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_or_rant/screens/onboard.dart';

import 'package:rest_or_rant/screens/utils/store.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final GlobalStore globalStore = Get.put(GlobalStore());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: Obx(
        () => Column(
          //padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Name"),
              subtitle: Text(globalStore.name.value),
              enabled: false,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_outlined),
              title: const Text("Date of Birth"),
              subtitle: Text(globalStore.dob.value),
              enabled: false,
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone_rounded),
              title: const Text("Phone Number"),
              subtitle: Text(globalStore.phoneNumber.value),
              enabled: false,
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail_rounded),
              title: const Text("Email"),
              subtitle: Text(user!.email.toString()),
              enabled: false,
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text("Address"),
              subtitle: Text(globalStore.address.value),
              enabled: false,
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              trailing: const Icon(Icons.chevron_right_rounded),
              title: const Text("Edit Details"),
              subtitle: const Text("Update name, address .."),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => OnBoard()));
              },
            ),
            const Spacer(flex: 1),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const Icon(Icons.logout_outlined),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                FirebaseAuth.instance.signOut();
                globalStore.resetUser();
                Navigator.of(context).pop();
              },
              title: const Text("Log out"),
              tileColor: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
