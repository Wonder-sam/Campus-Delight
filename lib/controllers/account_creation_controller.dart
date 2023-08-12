import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart';

final lastNameProvider = StateProvider((ref) => "");
final firstNameProvider = StateProvider((ref) => "");
final phoneProvider = StateProvider((ref) => "");
final accountFinishingProvider = StateProvider((ref) => false);
final TextEditingController phoneController = TextEditingController();

void handleLastName(String text, WidgetRef ref) {
  ref.read(lastNameProvider.notifier).state = text;
}

void handleFirstName(String text, WidgetRef ref) {
  ref.read(firstNameProvider.notifier).state = text;
}

void handlePhone(PhoneNumber phone, WidgetRef ref) {
  if (phone.number.startsWith('0')) {
    print("here");
    ref.read(phoneProvider.notifier).state = phone.countryCode + phone.number.substring(1);
    phoneController.text = phone.number.substring(1);
  } else {
    ref.read(phoneProvider.notifier).state = phone.completeNumber;
  }
  print(ref.read(phoneProvider.notifier).state);
}
