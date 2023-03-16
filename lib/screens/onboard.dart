import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:rest_or_rant/screens/utils/store.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController phoneInput = TextEditingController();
  TextEditingController addressInput = TextEditingController();
  final GlobalStore globalStore = Get.put(GlobalStore());

  @override
  void initState() {
    nameInput.text = globalStore.name.value;
    dateInput.text = globalStore.dob.value;
    addressInput.text = globalStore.address.value;
    phoneInput.text = globalStore.phoneNumber.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Onboarding")),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: nameInput,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Name'),
              onChanged: (value) {
                globalStore.name(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: dateInput,
              //editing controller of this TextField
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Date of Birth'),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  globalStore.dob(formattedDate);

                  setState(() {
                    dateInput.text = formattedDate;
                  });
                } else {}
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: phoneInput,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                globalStore.phoneNumber(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: addressInput,
              decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Address'),
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) {
                globalStore.address(value);
              },
            ),
          ),
          if (!globalStore.onBoarded.value) const Divider(),
          if (!globalStore.onBoarded.value)
            ElevatedButton(
              onPressed: () {
                if (globalStore.detailsFilled) {
                  globalStore.storeDetails();
                  globalStore.updateOnBoarded(true);
                }
              },
              child: const Text("SUBMIT"),
            ),
        ],
      ),
    );
  }
}
