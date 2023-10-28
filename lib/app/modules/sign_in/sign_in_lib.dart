library sign_in_lib;

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../constant/constants.dart';
import '../../../router/app_routes.dart';

///components

///controllers && state
part 'cubit/sign_in_controller.dart';
part 'cubit/sign_in_state.dart';


///views
part 'views/sign_in_view.dart';