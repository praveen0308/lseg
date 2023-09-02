import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_content/edit_content_screen_cubit.dart';

import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/ext_methods.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';
import 'package:lseg/utils/util_methods.dart';

class MoreDetailsForm extends StatefulWidget {
  final ContentModel data;
  final File? pdf;
  final File? thumbnail;
  const MoreDetailsForm({super.key, required this.data, this.pdf, this.thumbnail});

  @override
  State<MoreDetailsForm> createState() => _MoreDetailsFormState();
}

class _MoreDetailsFormState extends State<MoreDetailsForm>
    with BasePageState {
  // final courseTypes = ["Free", "Paid"];
  final courseTypes = ["Free"];
  var isPriceAmountEnabled = false;

  final _priceAmountController = TextEditingController();
  final _courseTypeController = DropdownFieldViewController<String>();
  final _contentMoreDetailsKey = GlobalKey<FormState>();


  @override
  void initState() {
    _courseTypeController.setDropdownItems(courseTypes);
    _courseTypeController.setDropdownValue(courseTypes[0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _contentMoreDetailsKey,
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownFieldView<String>(
                controller: _courseTypeController,
                label: "Price",
                validator: (value) {
                  if (value == null) {
                    return 'Please course type.';
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    isPriceAmountEnabled = val==courseTypes[1];
                    if(!isPriceAmountEnabled){
                      _priceAmountController.text = "";
                    }
                  });
                },
              ),
              /*TextInputFieldView(
                label: "If Paid",
                textEditingController: _priceAmountController,
                placeHolder: "Rs. 0",
                inputType: TextInputType.number,
                isEnabled: isPriceAmountEnabled,
              ),*/
              label("Browse PDF (Max size 10MB)"),
              vGap(),
              GestureDetector(
                onTap: ()async{
                  FilePickerResult? fileResult = await FilePicker.platform
                      .pickFiles(type: FileType.custom,allowedExtensions: ["pdf"], allowMultiple: false);
                  if (fileResult != null) {
                    var file =File(fileResult.files.first.path!);
                    double sizeInMb = file.lengthSync() / (1024 * 1024);
                    if(sizeInMb<25){
                      BlocProvider.of<EditContentScreenCubit>(context).pickContentPdf(file);
                    }else{
                      showToast("Pick file less than 25 MB.", ToastType.warning);
                    }

                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54,width: 2),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.picture_as_pdf),
                      hGap(),
                      const Text("Update Pdf")
                    ],
                  ),
                ),
              ),
              vGap(),
              if(widget.pdf!=null) Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(widget.pdf!.getFileName())),
                    Text(widget.pdf!.getFileSizeString())
                  ],
                ),
              ),
              vGap(),
              label("Browse Thumbnail (Max size 1MB)"),
              vGap(),
              GestureDetector(
                onTap: ()async{
                  FilePickerResult? fileResult = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (fileResult != null) {
                    var file =File(fileResult.files.first.path!);
                    double sizeInMb = file.lengthSync() / (1024 * 1024);
                    if(sizeInMb<1){
                      context.read<EditContentScreenCubit>().pickContentThumbnail(file);
                    }else{
                      showToast("Pick file less than 1 MB.", ToastType.warning);
                    }

                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54,width: 2),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.image),
                      hGap(),
                      const Text("Update Thumbnail")
                    ],
                  ),
                ),
              ),
              vGap(),
              if(widget.thumbnail!=null) SizedBox(
                height: 150,
                child: Image.file(widget.thumbnail!),
              ),
              vGap(height: 40),
              OutlinedButton(
                  onPressed: () {
                    BlocProvider.of<EditContentScreenCubit>(context)
                        .navigateToPage(0);
                  },
                  child: const Text(AppStrings.back)),
              vGap(),
              ElevatedButton(
                  onPressed: () {
                    if (_contentMoreDetailsKey.currentState!.validate()) {
                      BlocProvider.of<EditContentScreenCubit>(context)
                          .submitContentMoreDetails(
                          courseType: _courseTypeController.value,
                          priceAmount: _priceAmountController.text);
                    }

                  },
                  child: const Text(AppStrings.submit)),
            ],
          ),
        ),
      ),
    );;
  }
}
