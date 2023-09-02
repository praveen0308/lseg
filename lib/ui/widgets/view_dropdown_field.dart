import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownFieldViewController<T> {
  List<T>? items;
  T? value;

  DropdownFieldViewController({this.items, this.value});

  void setDropdownValue(T? value) {
    this.value = value;
  }

  void setDropdownItems(List<T>? items) {
    this.items = items;
  }
}

class DropdownFieldView<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final Function(T?)? onChanged;
  final Function(T?)? onSaved;
  final String? Function(T? val)? validator;
  final DropdownFieldViewController controller;

  const DropdownFieldView({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.label,
    this.hint,
  });

  @override
  State<DropdownFieldView<T>> createState() => _DropdownFieldViewState<T>();
}

class _DropdownFieldViewState<T> extends State<DropdownFieldView<T>> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.label ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        DropdownButtonFormField2<T>(
          isExpanded: true,
          value: widget.controller.value,
          decoration: InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            // Add more decoration..
          ),
          hint: Text(
            widget.hint ?? "",
            style: const TextStyle(fontSize: 14),
          ),
          items: widget.controller.items
              ?.map((item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      item.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: widget.validator,
          onChanged: (v) {
            widget.controller.value = v;
            if (widget.onChanged != null) {
              widget.onChanged!(v);
            }
          },
          onSaved: (v) {
            widget.controller.value = v;
            if (widget.onSaved != null) {
              widget.onSaved!(v);
            }
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
