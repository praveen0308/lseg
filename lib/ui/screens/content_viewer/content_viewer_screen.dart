import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'content_viewer_screen_cubit.dart';

class ContentViewerScreenArgs{
  final String pdfUrl;
  final String audioUrl;

  ContentViewerScreenArgs(this.pdfUrl, this.audioUrl);
}
@RoutePage()
class ContentViewerScreen extends StatefulWidget implements AutoRouteWrapper{
  final ContentViewerScreenArgs args;
  const ContentViewerScreen({super.key, required this.args});

  @override
  State<ContentViewerScreen> createState() => _ContentViewerScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => ContentViewerScreenCubit(), child: this);
  }
}

class _ContentViewerScreenState extends State<ContentViewerScreen> {
  final _controller = PdfViewerController();

  @override
  void initState() {

    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Upgrade'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Buy this course to continue'),
                  Text('Would you like to purchase this course?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pop(context,false);
                },
              ),
              TextButton(
                child: const Text('Purchase'),
                onPressed: () {
                  // todo navigate to purchase course
                },
              ),

            ],
          ),
        );
      },
    ).then((value){
      if(value==false){
        AutoRouter.of(context).pop();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SfPdfViewer.network(
        widget.args.pdfUrl,
          enableTextSelection: false,
          interactionMode: PdfInteractionMode.pan,
        controller: _controller,
        onPageChanged: (PdfPageChangedDetails details) {
          if(details.newPageNumber>5){
            _showMyDialog();
          }
        },
      ),
    );
  }
}
