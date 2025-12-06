# Recipes List Demo


Minimal Flutter app that parses a JSON list of recipes and displays the recipe titles in a `ListView`.

Quick run (Windows PowerShell):

```powershell
cd "C:/Users/sarke/OneDrive/Documents/app/live test"
flutter pub get
flutter run
```

Notes:
- The sample JSON is provided in `assets/recipes.json` and referenced from `lib/main.dart`.
- If you change the asset path, update `pubspec.yaml` and the `rootBundle.loadString(...)` path accordingly.
