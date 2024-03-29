


import 'dart:io';

import 'package:assessment/common/async_bloc/async_error.dart';

class ErrorMapper{

  AsyncError? Function(dynamic error)? mapper;
  AsyncError? Function(dynamic error)? defaultMapper;

  ErrorMapper({this.mapper, this.defaultMapper});

  AsyncError map(dynamic error){

    if(mapper != null){
      var asyncError = mapper!(error);
      if(asyncError != null){
        return asyncError;
      }
    }
    if (error is AsyncError) {
      return error;
    }
    if(error is SocketException){
      return AsyncError("Unable to connect to the server. Please check your internet connection and try again.");
    }

    if(defaultMapper != null){
      var asyncError = defaultMapper!(error);
      if(asyncError != null){
        return asyncError;
      }
    }
    return AsyncError("We're sorry, but something went wrong. Please contact customer support for assistance.");
  }

}