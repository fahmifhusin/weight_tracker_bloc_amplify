# Weight Tracker

Flutter App Development for Demo Purpose

---

## Getting Started 🚀

The APK sample and demo can be accessed from this link:
https://drive.google.com/drive/folders/1U_NUDT1oaMXQp3UjwCkM_LRKN95o0Wg0?usp=sharing

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Weight Tracker works on Android and iOS._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

---

dependencies:
bloc: ^8.1.2
flutter_bloc: ^8.1.3
flutter_dotenv: ^5.0.2
intl: ^0.18.0
flutter_svg: 2.0.6
shared_preferences: 2.1.1
dio: 5.2.1+1
go_router: ^12.0.0
amplify_flutter: ^1.5.0
amplify_datastore: ^1.5.0
amplify_api: ^1.5.0
amplify_auth_cognito: ^1.5.0
flutter:
sdk: flutter


dev_dependencies:
flutter_launcher_icons: ^0.13.1
bloc_test: ^9.1.2
flutter_test:
sdk: flutter
mocktail: ^0.3.0
very_good_analysis: ^5.0.0
logger: ^1.3.0

[amplify_flutter_link]:https://pub.dev/packages/amplify_flutter
[amplify_datastore_link]:https://pub.dev/packages/amplify_datastore
[amplify_api_link]:https://pub.dev/packages/amplify_api
[amplify_auth_cognito_link]:https://pub.dev/packages/amplify_auth_cognito
[bloc_link]: https://pub.dev/packages/bloc
[bloc_test_link]: https://pub.dev/packages/bloc_test
[dio_link]:https://pub.dev/packages/dio
[flutter_bloc_link]: https://pub.dev/packages/flutter_bloc
[flutter_dotenv_link]: https://pub.dev/packages/flutter_dotenv
[flutter_bloc_link]: https://pub.dev/packages/flutter_launcher_icons
[flutter_svg_link]:https://pub.dev/packages/flutter_svg
[flutter_bloc_link]: https://pub.dev/packages/flutter_test
[go_router_link]:https://pub.dev/packages/go_router
[intl_link]:https://pub.dev/packages/intl
[logger_link]: https://pub.dev/packages/logger
[mocktail_link]: https://pub.dev/packages/mocktail
[shared_preferences_link]:https://pub.dev/packages/shared_preferences
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
