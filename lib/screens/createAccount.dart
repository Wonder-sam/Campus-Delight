import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/utils/dimensions.dart';

class CreateAccount extends ConsumerWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
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
                    bottom: MediaQuery.of(context).size.width * 0.03),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Additional information",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )),
            TextField(
              onChanged: (text) => null,
              decoration: InputDecoration(
                labelText: "Last Name",
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: const TextStyle(color: Colors.brown, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.9,
                    color: Colors.brown,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextField(
              onChanged: (text) => null,
              decoration: InputDecoration(
                labelText: "First Name(s)",
                floatingLabelAlignment: FloatingLabelAlignment.center,
                labelStyle: const TextStyle(
                  color: Colors.brown,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.9,
                    color: Colors.brown,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            IntlPhoneField(
              initialCountryCode: "GH",
              decoration: InputDecoration(
                counterText: '',
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelText: 'Phone Number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.9,
                    color: Colors.brown,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04,
                  ),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: Colors.brown,
                  ),
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
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
                        textStyle: const TextStyle(
                          color: Colors.black45,
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
                            textStyle: const TextStyle(
                              color: Colors.black45,
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
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigator(),
                  ),
                ),
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
