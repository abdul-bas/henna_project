// import 'dart:async';

// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app/state_management/api_service/api_bloc.dart';
// import 'package:todo_app/state_management/api_service/api_event.dart';

// class Debouncer {
//   Timer? _debounce;

  
//   void run(BuildContext context) {
   
//     if (_debounce?.isActive ?? false) _debounce!.cancel();

  
//     _debounce = Timer(const Duration(minutes: 1), () {
//       context.read<ApiBloc>().add(ApiGet());
//     });
//   }

  
//   void dispose() {
//     _debounce?.cancel();
//   }
// }
