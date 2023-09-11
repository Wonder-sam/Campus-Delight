import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/widgets/loading_activity.dart';

activitySnackbar(String text, double height, double width, Map<String, dynamic> color) {
  return SnackBar(
    content: Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: color['activity'],
            strokeWidth: 2,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        )
      ],
    ),
    backgroundColor: color['background'],
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: height, left: width, right: width),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 1,
  );
}

feedbackSnackbar(String text, double height, double width, Icon icon, Map<String, dynamic> color) {
  return SnackBar(
    content: Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        )
      ],
    ),
    backgroundColor: color['background'],
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: height, left: width, right: width),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 1,
  );
}
