import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/res/res.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool? isRequired;
  final String? placeHolder;
  final TextInputType? inputType;
  final int? maxLength;
  final bool isEnabled;

  const TextInput(
      {super.key,
      required this.label,
      required this.textEditingController,
      this.isRequired = false,
      this.placeHolder,
      this.inputType,
      this.maxLength,
      this.isEnabled = true});

  String _getInputLabel() {
    if (isRequired == true) {
      return "$label *";
    } else {
      return label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            _getInputLabel(),
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
        TextFormField(
          controller: textEditingController,
          maxLength: maxLength,
          enabled: isEnabled,
          decoration: InputDecoration(
              hintText: placeHolder,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: AppColors.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: AppColors.primary),
                borderRadius: BorderRadius.circular(5),
              )),
        )
      ],
    );
  }
}