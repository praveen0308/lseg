import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lseg/res/res.dart';

class DateTextFieldViewController {
  DateTime? value;


  DateTextFieldViewController({this.value});

  void setDate(DateTime? value) {
    this.value = value;
  }
}

class DateTextFieldView extends StatefulWidget {
  final String label;
  final bool isRequired;
  final Function(DateTime dateTime) onDateSelected;
  final String? Function(String? val)? validator;
  final DateTextFieldViewController? controller;

  const DateTextFieldView(
      {super.key,
      required this.label,
      required this.isRequired,
      required this.onDateSelected,
      required this.validator,
      this.controller});

  @override
  State<DateTextFieldView> createState() => _DateTextFieldViewState();
}

class _DateTextFieldViewState extends State<DateTextFieldView> {
  late DateTime selectedDate;
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
      widget.onDateSelected(selectedDate);
    }
  }

  @override
  void initState() {
    selectedDate = widget.controller?.value == null
        ? DateTime(2008)
        : widget.controller!.value!;
    dateTextController.text = DateFormat("dd MMM yyyy").format(selectedDate);
    widget.onDateSelected(selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.label,
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
              validator: widget.validator,
            ),
            Positioned(
                right: 8,
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
