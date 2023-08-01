import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/repository/firebase_auth_repository_impl.dart';
import 'package:lseg/local/local.dart';

class AppProviders{
  static getAppProviders(){
    return  [
      RepositoryProvider(create: (context)=> AppStorage()),
      RepositoryProvider(create: (context)=> FirebaseLoginRepositoryImpl()),
    ];
  }
}