import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_content/edit_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';
import 'package:search_choices/search_choices.dart';

class BasicDetailsForm extends StatefulWidget {
  final ContentModel data;
  final List<CategoryModel> categories;
  const BasicDetailsForm({super.key, required this.data, required this.categories});

  @override
  State<BasicDetailsForm> createState() => _BasicDetailsFormState();
}

class _BasicDetailsFormState extends State<BasicDetailsForm>
    with BasePageState {

  final _contentBasicDetailsKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _subTitle = TextEditingController();

  final _formatController = DropdownFieldViewController<String>();
  final _description = TextEditingController();

  CategoryModel selectedCategory = CategoryModel();
  var categories = List<DropdownMenuItem<CategoryModel>>.empty(growable: true);
  final contentFormats = ["Handwritten", "Computerized"];
  late ContentModel content;
  @override
  void initState() {
    content = widget.data;
    _formatController.setDropdownItems(contentFormats);

    _title.text = content.title ?? "";
    _subTitle.text = content.subtitle ?? "";
    _formatController.value = content.format ?? "";
    _description.text = content.description ?? "";
    for (var element in widget.categories) {
      categories.add(DropdownMenuItem(value: element,child: Text(element.name ?? ""),));
    }
    selectedCategory = CategoryModel(id: content.categoryId,name: content.category,icon: "",isActive: true,order: 0);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    if(_contentBasicDetailsKey.currentState!.validate()){
                      BlocProvider.of<EditContentScreenCubit>(context).submitContentBasicDetails(
                          title: _title.text,
                          subTitle: _subTitle.text,
                          description: _description.text,
                          category: selectedCategory,
                          format: _formatController.value
                      );
                    }
                  },
                  child: const Text(AppStrings.next))
            ],
          ),
        ),
      ),
    );
  }
}
