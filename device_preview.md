# Terminal

```bash
flutter pub add device_preview
```

# No código

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MeuApp(),
    ),
  );
}