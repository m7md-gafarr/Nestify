# Nestify – Home & Décor Shopping App

## Description

Nestify is a Flutter mobile app for browsing home décor and room setups, managing a cart and saved items, and handling user accounts with Firebase Auth and Firestore. It includes onboarding, localization, theming, and connectivity-aware UI, with Supabase storage for media and shared preferences for onboarding/login state.

## Features

- Onboarding flow that hands off to the main experience once completed
- Email/password auth (register, login, password reset) via Firebase Auth
- Home feed with categories, rooms, product catalog, product details, and reviews
- Cart/Bag with quantity updates and real-time sync in Firestore
- Saved items (wishlist) per user
- Best categories and curated catalogs backed by Firestore collections
- Connectivity checking with offline fallback screen
- Localization-ready (Intl + generated `S` delegate) and light/dark theming
- Supabase storage helper for media uploads; SharedPreferences for local flags
- Responsive layout with `flutter_screenutil`

## Project Structure

```
lib/
	main.dart                    # App bootstrap, providers, Firebase & Supabase init
	firebase_options.dart        # FlutterFire config (generated)
	components/                  # Shared widgets (e.g., bottom nav)
	core/
		constants/                 # App-wide constants (collections, strings)
		router/                    # Route names and centralized router
		theme/                     # Light/Dark theme definitions
		utils/                     # Language/theme providers, dialogs, validation, etc.
		images/                    # Generated asset references
	data/
		data_sources/
			local/                   # SharedPreferences wrapper
			remote/                  # API helpers (HTTP error handling)
		services/
			account_service/         # Auth service, Firestore user service
			bag_service/             # Firestore bag/cart operations
			home_service/            # Products, reviews, rooms, categories, subscribes
			saved_item_service/      # Wishlist persistence
			supabase_storage_service.dart # Media uploads
	features/
		introducation/             # Onboarding screen
		home/                      # Logic/models/views for home, catalog, products
		bag/                       # Cart UI + state
		saved_items/               # Wishlist UI + state
		account/                   # Login/Register/Password reset/Profile/Orders
		Settings/                  # Settings screen
		no_internet/               # Offline UI
	generated/, l10n/            # Intl localization outputs
assets/
	images/, logo/, fonts/       # App assets and Cairo font family
public/                        # Web hosting assets (if using Flutter web)
android/, ios/, macos/, linux/, windows/ # Platform projects
```

## Tech Stack

- Flutter (SDK ^3.8.1), Dart
- State management: `flutter_bloc`, `bloc`, `provider`
- Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`
- Supabase: `supabase_flutter` (storage uploads)
- UI/UX: `flutter_screenutil`, `animations`, `cached_network_image`, `shimmer`, `lottie`, `smooth_page_indicator`
- Assets & media: `flutter_svg`, `image_picker`
- Utilities: `shared_preferences`, `intl`, `url_launcher`, `connectivity_plus`

## Installation & Setup

1. Prerequisites: Flutter SDK 3.8+, Android Studio / Xcode, Firebase CLI (for platform configs).
2. Clone: `git clone https://github.com/m7md-gafarr/DEPI-Graduation-project.git` and `cd DEPI-Graduation-project`.
3. Install deps: `flutter pub get`.
4. Firebase setup:
   - Android: ensure `android/app/google-services.json` exists (already checked in). If changing project, run `flutterfire configure`.
   - iOS: ensure `ios/Runner/GoogleService-Info.plist` exists; rerun FlutterFire if replacing.
5. Supabase: update the URL and anon key used in `lib/main.dart` to match your project (consider moving them to secure config/secrets).
6. Assets/fonts: already referenced in `pubspec.yaml` (`assets/images/`, `assets/logo/`, Cairo font family). Run `flutter pub get` after changes.

## Running the Project

- Debug: `flutter run -d <device>`
- Hot restart/hot reload as usual in Flutter tooling
- Web (if configured): `flutter run -d chrome` (ensure Firebase/Supabase configs allow web origins)

## Screenshots (placeholders)

- `![Home](./docs/screens/home.png)`
- `![Catalog](./docs/screens/catalog.png)`
- `![Bag](./docs/screens/bag.png)`
- `![Account](./docs/screens/account.png)`

## API / Modules

- Routing: `core/router/router.dart` with typed names in `core/router/route_names.dart`
- Auth: `AuthService` (Firebase Auth), `LoginCubit`, `RegisterCubit`, `ForgotPasswordCubit`
- User profile: `UserFirestoreService`, `CompleteAddDataCubit`, `UpdateUserDataCubit`, `GetUserDataCubit`
- Catalog: `ProductService` (Firestore products), `BestCategoryCubit`, `RoomsCubit`, `RoomCategoryCubit`, `FilterAndSortCubit`, `NewReviewCubit`
- Bag/Cart: `BagService` + `BagCubit` for add/update/remove with Firestore transactions
- Saved items: `SavedItemService` + `SavedItemsCubit`
- Storage: `SupabaseStorageService` for uploads
- Local storage: `SharedPreferencesService` for onboarding/login flags
- Connectivity: `CheckConnectionCubit` with `NoInternetScreen`

## Testing

- Run unit/widget tests: `flutter test`
- Add more coverage for cubits/services as the codebase grows

## Build & Deployment

- Android release APK: `flutter build apk --release`
- Android App Bundle: `flutter build appbundle --release`
- iOS release: `flutter build ios --release` (requires Xcode setup)
- Web build (if enabled): `flutter build web`
- Ensure Firebase/Supabase credentials are set per environment before shipping

## Contribution Guide

- Fork and clone the repo
- Create a branch: `git checkout -b feature/<short-name>` or `bugfix/<short-name>`
- Keep changes scoped and add tests where possible
- Run `flutter format`/`dart format` and `flutter analyze` before committing
- Open a pull request with a clear description and screenshots (if UI changes)

## License

MIT License (edit if needed)

## Badges

- Build: `![Build Status](https://img.shields.io/badge/build-passing-lightgrey)`
- License: `![License](https://img.shields.io/badge/license-MIT-blue)`
- Flutter: `![Flutter](https://img.shields.io/badge/flutter-3.8%2B-02569B)`
