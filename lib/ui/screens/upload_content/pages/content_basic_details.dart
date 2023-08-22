import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/upload_content/upload_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';
import 'package:search_choices/search_choices.dart';

class ContentBasicDetails extends StatefulWidget {
  const ContentBasicDetails({super.key});

  @override
  State<ContentBasicDetails> createState() => _ContentBasicDetailsState();
}

class _ContentBasicDetailsState extends State<ContentBasicDetails>
    with BasePageState {
  final _title = TextEditingController();
  final _subTitle = TextEditingController();
  final contentFormats = ["Handwritten", "Computerized"];


  final _description = TextEditingController();
  final _formatController = DropdownFieldViewController<String>();
  final _categoriesController = DropdownFieldViewController<CategoryModel>();
  final _contentBasicDetailsKey = GlobalKey<FormState>();
  CategoryModel? selectedCategory;
  var categories = List<DropdownMenuItem<CategoryModel>>.empty(growable: true);

  @override
  void initState() {
    _formatController.setDropdownItems(contentFormats);

    super.initState();
    BlocProvider.of<UploadContentScreenCubit>(context).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadContentScreenCubit, UploadContentScreenState>(
      listener: (context, state) {
        if(state is ReceivedCategories){
          _categoriesController.setDropdownItems(state.categories);
          categories.clear();
          for(var category in state.categories){
            categories.add(DropdownMenuItem(value: category,child: Text(category.toString()),));
          }
          // selectedCategory = categories[0].value;
          setState(() {});
        }
        if(state is ValidateBasicDetails){
          if(_contentBasicDetailsKey.currentState!.validate()){
            BlocProvider.of<UploadContentScreenCubit>(context).submitContentBasicDetails(
              title: _title.text,
              subTitle: _subTitle.text,
              description: _description.text,
              category: selectedCategory,
              format: _formatController.value
            );
          }
        }
      },
      child: Form(
        key: _contentBasicDetailsKey,
        child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextInputFieldView(
                  label: AppStrings.title,
                  textEditingController: _title,
                  placeHolder: "Enter title",
                ),
                TextInputFieldView(
                    label: AppStrings.subTitle,
                    textEditingController: _subTitle,
                    placeHolder: "Enter subtitle"),
                DropdownFieldView<String>(
                  controller: _formatController,
                  label: AppStrings.format,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select format.';
                    }
                    return null;
                  }
                ),
                /*DropdownFieldView<CategoryModel>(
                  controller: _categoriesController,
                  label: AppStrings.categories,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select category.';
                    }
                    return null;
                  }
                ),*/
                label("Category"),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()
                  ),
                  child: SearchChoices.single(
                    displayClearIcon: false,
                    underline: "",
                    padding: const EdgeInsets.all(5),
                    items: categories,
                    value: selectedCategory,
                    hint: "Select one",
                    searchHint: "Select one",
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                TextInputFieldView(
                    label: AppStrings.description,
                    textEditingController: _description,
                    placeHolder: "Enter description"),
                vGap(height: 32),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UploadContentScreenCubit>(context)
                          .validateBasicDetails();
                    },
                    child: const Text(AppStrings.next))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
