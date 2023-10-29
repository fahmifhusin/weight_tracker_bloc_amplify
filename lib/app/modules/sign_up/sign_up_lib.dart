library sign_up_lib;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weight_tracker/constant/constants.dart';

import '../../../router/app_routes.dart';

///components
part 'components/card_sign_up.dart';
part 'components/card_sign_up_verification.dart';
///controllers && state
part 'cubit/sign_up_controller.dart';
part 'cubit/sign_up_state.dart';
///views
part 'views/sign_up_view.dart';