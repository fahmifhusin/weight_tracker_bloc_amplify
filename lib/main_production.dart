import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weight_tracker/app/app.dart';
import 'package:weight_tracker/bootstrap.dart';
import 'package:weight_tracker/utils/flavors.dart';

import 'constant/constants.dart';

Future<void> main() async {
  F.appFlavor = Flavor.development;
  await dotenv.load(fileName: environmentPath.development).then((_) => logger.d(envName));
  bootstrap(() => const App());
}
