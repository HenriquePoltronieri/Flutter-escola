# Terminal

```bash
flutter pub add device_preview
```

ou

```bash
dart pub add get
```

# No código

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}