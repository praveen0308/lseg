import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lseg/res/res.dart';

class DateTextFieldViewController {
  DateTime? value;

  void setDate(DateTime? value) {
    this.value = value;
  }
}

class DateTextFieldView extends StatelessWidget {
  final String label;
  final bool isRequired;
  final Function(DateTime dateTime) onDateSelected;
  final String? Function(String? val)? validator;
  final DateTextFieldViewController? controller;
  late DateTime selectedDate;

  DateTextFieldView(
      {super.key,
      required this.label,
      required this.isRequired,
      required this.onDateSelected,
      required this.validator,
      this.controller}) {
    selectedDate =
        controller?.value == null ? DateTime(2008) : controller!.value!;
  }

  final dateTextController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateTextController.text = DateFormat("dd MMM yyyy").format(selectedDate);
      onDateSelected(selectedDate);
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
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
        Stack(
          children: [
            TextFormField(
              controller: dateTextController,
              enabled: false,
              decoration: InputDecoration(
                  hintText: "dd MMM yyyy",
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
              validator: validator,
            ),
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: const Icon(Icons.calendar_today),
                ))
          ],
        )
      ],
    );
  }
}
