import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/upload_content/upload_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/ext_methods.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';
import 'package:lseg/utils/util_methods.dart';

class ContentMoreDetails extends StatefulWidget {
  const ContentMoreDetails({super.key});

  @override
  State<ContentMoreDetails> createState() => _ContentMoreDetailsState();
}

class _ContentMoreDetailsState extends State<ContentMoreDetails>
    with BasePageState {
  final courseTypes = ["Free", "Paid"];
  var isPriceAmountEnabled = false;

  final _priceAmountController = TextEditingController();
  final _courseTypeController = DropdownFieldViewController<String>();
  final _contentMoreDetailsKey = GlobalKey<FormState>();

  File? contentPdf;
  File? contentThumbnail;
  @override
  void initState() {
    _courseTypeController.setDropdownItems(courseTypes);
    _courseTypeController.setDropdownValue(courseTypes[0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadContentScreenCubit, UploadContentScreenState>(
      listener: (context, state) {
        if(state is ContentPdfAvailable){
          contentPdf = state.file;
        }
        if(state is ContentThumbnailAvailable){
          contentThumbnail = state.file;
        }
        if (state is ValidateMoreDetails) {
          if (_contentMoreDetailsKey.currentState!.validate()) {
            BlocProvider.of<UploadContentScreenCubit>(context)
                .submitContentMoreDetails(
                courseType: _courseTypeController.value,
                priceAmount: _priceAmountController.text);
          }
        }
      },
      child: BlocBuilder<UploadContentScreenCubit, UploadContentScreenState>(
        builder: (context, state) {
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
                    TextInputFieldView(
                      label: "If Paid",
                      textEditingController: _priceAmountController,
                      placeHolder: "Rs. 0",
                      inputType: TextInputType.number,
                      isEnabled: isPriceAmountEnabled,
                    ),
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
                            BlocProvider.of<UploadContentScreenCubit>(context).pickContentPdf(file);
                          }else{
                            showToast("Pick file less than 10 MB.", ToastType.warning);
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
                            const Text("Pick Pdf")
                          ],
                        ),
                      ),
                    ),
                    vGap(),
                    if(contentPdf!=null) Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(contentPdf!.getFileName())),
                          Text(contentPdf!.getFileSizeString())
                        ],
                      ),
                    ),
                    vGap(),
                    label("Browse Thumbnail (Max size 1MB)"),
                    vGap(),
                    GestureDetector(
                      onTap: ()async{
                        FilePickerResult? file = await FilePicker.platform
                            .pickFiles(type: FileType.image, allowMultiple: false);
                        if (file != null) {
                          BlocProvider.of<UploadContentScreenCubit>(context).pickContentThumbnail(File(file.files.first.path!));
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
                            const Text("Pick Thumbnail")
                          ],
                        ),
                      ),
                    ),
                    vGap(),
                    if(contentThumbnail!=null) SizedBox(
                      height: 150,
                      child: Image.file(contentThumbnail!),
                    ),
                    vGap(height: 40),
                    OutlinedButton(
                        onPressed: () {
                          BlocProvider.of<UploadContentScreenCubit>(context)
                              .backNavigate();
                        },
                        child: const Text(AppStrings.back)),
                    vGap(),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<UploadContentScreenCubit>(context)
                              .validateMoreDetails();
                        },
                        child: const Text(AppStrings.submit)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
