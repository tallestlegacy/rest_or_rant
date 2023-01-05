import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          () => ListView(
            //padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Name"),
                subtitle: Text(globalStore.name.value),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text("Date of Birth"),
                subtitle: Text(globalStore.dob.value),
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone_rounded),
                title: const Text("Phone Number"),
                subtitle: Text(globalStore.phoneNumber.value),
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail_rounded),
                title: const Text("Email"),
                subtitle: Text(user!.email.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text("Address"),
                subtitle: Text(globalStore.address.value),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                },
                title: const Text("Log out"),
                tileColor: Colors.redAccent,
              )
            ],
          ),
        ));
  }
}
