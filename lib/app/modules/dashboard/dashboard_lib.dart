library dashboard_lib;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/constant/constants.dart';

import '../../../models/WeigtTrackerUserModel.dart';
import '../../../router/app_routes.dart';

///components
part 'components/item_outline_card_dashboard.dart';
part 'components/account_preview.dart';
part 'components/list_weight_data.dart';
///controllers
part 'cubit/dashboard_controller.dart';
part 'cubit/dashboard_state.dart';

///views
part 'views/dashboard_view.dart';