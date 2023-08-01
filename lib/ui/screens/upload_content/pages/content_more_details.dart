import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/widgets/text_input.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

class ContentMoreDetails extends StatefulWidget {
  const ContentMoreDetails({super.key});

  @override
  State<ContentMoreDetails> createState() => _ContentMoreDetailsState();
}

class _ContentMoreDetailsState extends State<ContentMoreDetails> with BasePageState{
  final courseTypes = ["Free", "Paid"];

  var selectedCourseType = "";

  final _priceAmount = TextEditingController();
  final _contentPdf = TextEditingController();
  final _contentThumbnail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              label("Price"),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Free/Paid',
                  style: TextStyle(fontSize: 14),
                ),
                items: courseTypes
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select type.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedCourseType = value.toString();
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
              TextInput(label: "If Paid", textEditingController: _priceAmount,placeHolder: "Rs. 0"),
              TextInput(label: "Browse PDF (Max.: 25 mb)", textEditingController: _contentPdf,isEnabled: false,),
              TextInput(label: "Browse Thumbnail (1:1)", textEditingController: _contentThumbnail,isEnabled: false,),
              vGap()
            ],
          ),
        ),
      ),
    );
  }
}
