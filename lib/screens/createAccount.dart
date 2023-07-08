import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';
import 'package:zone/utils/dimensions.dart';

final lastNameProvider = StateProvider((ref) => "");
final firstNameProvider = StateProvider((ref) => "");
final phoneProvider = StateProvider((ref) => "");
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

class CreateAccount extends ConsumerWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastName = ref.watch(lastNameProvider);
    final firstName = ref.watch(firstNameProvider);
    final phone = ref.watch(phoneProvider);
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);

    void handleCreateAccount() async {
      if (lastName != '' && firstName != "" && phoneController.text != "") {
        bool success = await createAccount(firstName, lastName, phone);
        print(success);
        if (success) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BottomNavigator(),
            ),
          );
        }
      }
    }

    return Scaffold(
      appBar: null,
      backgroundColor: theme["background"],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: ScreenDimensions().dim_10(context),
          right: ScreenDimensions().dim_10(context),
          top: ScreenDimensions().dim_10H(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: ScreenDimensions().dim_05(context),
                bottom: MediaQuery.of(context).size.width * 0.03,
              ),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Additional information",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            TextField(
              onChanged: (text) => handleLastName(text, ref),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                ),
              ),
              decoration: InputDecoration(
                labelText: "Last Name",
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.9,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextField(
              onChanged: (text) => handleFirstName(text, ref),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                ),
              ),
              decoration: InputDecoration(
                labelText: "First Name(s)",
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.9,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            IntlPhoneField(
              controller: phoneController,
              disableLengthCheck: true,
              initialCountryCode: "GH",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                ),
              ),
              decoration: InputDecoration(
                counterText: '',
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: theme['inputFieldLabel'],
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.9,
                    color: theme['inputFieldBorder'],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: BorderSide(
                    width: 0.5,
                    color: theme['inputFieldBorder'],
                  ),
                ),
              ),
              onChanged: (phone) {
                handlePhone(phone, ref);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Checkbox(
                  fillColor: MaterialStatePropertyAll(Colors.brown),
                  value: true,
                  onChanged: null,
                ),
                SizedBox(
                  width: ScreenDimensions().dim_65(context),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "I agree to the ",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: theme['inputFieldLabel'],
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: "terms ",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "and ",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: theme['inputFieldLabel'],
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "conditions ",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
              child: MaterialButton(
                onPressed: () => handleCreateAccount(),
                color: Colors.brown,
                minWidth: ScreenDimensions().dim_80(context),
                height: ScreenDimensions().dim_15(context),
                textColor: Colors.white,
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
