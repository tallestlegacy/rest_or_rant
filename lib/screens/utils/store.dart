import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rest_or_rant/screens/utils/json.dart';

class GlobalStore extends GetxController {
  var box = GetStorage();
  var restaurants = [].obs;

  var name = "".obs;
  var phoneNumber = "".obs;
  var address = "".obs;
  var dob = "".obs;
  var onBoarded = false.obs;

  var cart = [].obs;
  var pendingCart = [].obs;
  var cartHistory = [].obs;

  get cartCount => cart.length;

  void storeDetails() {
    box.write("name", name.value);
    box.write("phoneNumber", phoneNumber.value);
    box.write("address", address.value);
    box.write("dob", dob.value);
  }

  void resetUser() {
    name("");
    phoneNumber("");
    address("");
    dob("");
    onBoarded(false);

    storeDetails();
  }

  void updateOnBoarded(value) {
    box.write("onBoarded", value);
    onBoarded(value);
  }

  get detailsFilled => name.isNotEmpty && phoneNumber.isNotEmpty && address.isNotEmpty && dob.isNotEmpty;

  get cartTotal {
    double total = 0;
    for (var item in cart) {
      if (item["quantity"] != null && item["price"] != null) {
        total += item["quantity"] * item["price"];
      }
    }
    return total;
  }

  updateRestaurants() async {
    restaurants(await fetchRestaurants());
  }

  bool inCart(var foodItem) {
    print(cart.toString());

    if (cart.isEmpty) return false;
    return cart.indexWhere((item) => item["id"] == foodItem["id"]) != -1;
  }

  void updateCart(Map<String, dynamic> foodItem) {
    if (inCart(foodItem)) {
      cart.removeWhere((item) => item["id"] == foodItem["id"]);
    } else {
      cart.add({...foodItem, "quantity": 1});
    }
  }

  void incrementAt(int index) {
    List temp = cart.toList();
    if (temp[index]["quantity"] < 10) {
      temp[index]["quantity"] += 1;
    }
    cart(temp);
  }

  void decrementAt(int index) {
    List temp = cart.toList();
    if (temp[index]["quantity"] > 1) {
      temp[index]["quantity"] -= 1;
    }

    cart(temp);
  }

  void checkoutCart() {
    cartHistory.add(cart.toList());
    pendingCart(cart.toList());
    cart([]);
  }

  GlobalStore() {
    updateRestaurants();
    onBoarded(box.read("onBoarded") ?? false);
    name(box.read("name") ?? "");
    phoneNumber(box.read("phoneNumber") ?? "");
    address(box.read("address") ?? "");
    dob(box.read("dob") ?? "");
  }
}
