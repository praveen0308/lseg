import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lseg/ui/screens/edit_content/edit_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_app_loading.dart';

class UpdateProgressForm extends StatefulWidget {
  final SubmissionStatus status;
  final List<SubmissionResult> results;

  const UpdateProgressForm(
      {super.key, required this.status, required this.results});

  @override
  State<UpdateProgressForm> createState() => _UpdateProgressFormState();
}

class _UpdateProgressFormState extends State<UpdateProgressForm> {

  @override
  Widget build(BuildContext context) {
    return widget.status == SubmissionStatus.inProgress
        ? Center(
          child:
              AppLoadingView(
                msg: "Updating Content...",
              ),
        )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var result = widget.results[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        result.isSuccess
                            ? const Icon(Icons.check)
                            : const Icon(Icons.error),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(result.message)
                      ],
                    ),
                  );
                },
                itemCount: widget.results.length,
              ),
              const Spacer(),

              ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  child: const Text("OKAY")),
              const SizedBox(height: 16,)
            ],
          );
  }
}
