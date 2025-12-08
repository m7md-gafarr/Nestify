// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Privacy Policy`
  String get privacyPolicyTitle {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get privacyIntroTitle {
    return Intl.message(
      'Introduction',
      name: 'privacyIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `We value your privacy and are committed to protecting your personal information. This policy explains what data we collect, how we use it, and your choices.`
  String get privacyIntroBody {
    return Intl.message(
      'We value your privacy and are committed to protecting your personal information. This policy explains what data we collect, how we use it, and your choices.',
      name: 'privacyIntroBody',
      desc: '',
      args: [],
    );
  }

  /// `Information We Collect`
  String get privacyInfoCollectTitle {
    return Intl.message(
      'Information We Collect',
      name: 'privacyInfoCollectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Account details you provide such as name, email, and phone number.`
  String get privacyInfoCollectItem1 {
    return Intl.message(
      'Account details you provide such as name, email, and phone number.',
      name: 'privacyInfoCollectItem1',
      desc: '',
      args: [],
    );
  }

  /// `Usage data like app interactions, device info, and crash logs.`
  String get privacyInfoCollectItem2 {
    return Intl.message(
      'Usage data like app interactions, device info, and crash logs.',
      name: 'privacyInfoCollectItem2',
      desc: '',
      args: [],
    );
  }

  /// `Optional inputs you share such as addresses and saved items.`
  String get privacyInfoCollectItem3 {
    return Intl.message(
      'Optional inputs you share such as addresses and saved items.',
      name: 'privacyInfoCollectItem3',
      desc: '',
      args: [],
    );
  }

  /// `How We Use Information`
  String get privacyUseInfoTitle {
    return Intl.message(
      'How We Use Information',
      name: 'privacyUseInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `To provide and improve app features, including personalization.`
  String get privacyUseInfoItem1 {
    return Intl.message(
      'To provide and improve app features, including personalization.',
      name: 'privacyUseInfoItem1',
      desc: '',
      args: [],
    );
  }

  /// `To process orders, payments, and customer support requests.`
  String get privacyUseInfoItem2 {
    return Intl.message(
      'To process orders, payments, and customer support requests.',
      name: 'privacyUseInfoItem2',
      desc: '',
      args: [],
    );
  }

  /// `To maintain security, prevent fraud, and comply with legal requirements.`
  String get privacyUseInfoItem3 {
    return Intl.message(
      'To maintain security, prevent fraud, and comply with legal requirements.',
      name: 'privacyUseInfoItem3',
      desc: '',
      args: [],
    );
  }

  /// `Sharing and Disclosure`
  String get privacySharingTitle {
    return Intl.message(
      'Sharing and Disclosure',
      name: 'privacySharingTitle',
      desc: '',
      args: [],
    );
  }

  /// `We do not sell your personal data.`
  String get privacySharingItem1 {
    return Intl.message(
      'We do not sell your personal data.',
      name: 'privacySharingItem1',
      desc: '',
      args: [],
    );
  }

  /// `We may share data with service providers (e.g., payments, analytics, cloud storage) under strict confidentiality.`
  String get privacySharingItem2 {
    return Intl.message(
      'We may share data with service providers (e.g., payments, analytics, cloud storage) under strict confidentiality.',
      name: 'privacySharingItem2',
      desc: '',
      args: [],
    );
  }

  /// `We may disclose information if required by law or to protect rights and safety.`
  String get privacySharingItem3 {
    return Intl.message(
      'We may disclose information if required by law or to protect rights and safety.',
      name: 'privacySharingItem3',
      desc: '',
      args: [],
    );
  }

  /// `Your Choices`
  String get privacyChoicesTitle {
    return Intl.message(
      'Your Choices',
      name: 'privacyChoicesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update or delete your account data through account settings where available.`
  String get privacyChoicesItem1 {
    return Intl.message(
      'Update or delete your account data through account settings where available.',
      name: 'privacyChoicesItem1',
      desc: '',
      args: [],
    );
  }

  /// `Control notifications from system settings.`
  String get privacyChoicesItem2 {
    return Intl.message(
      'Control notifications from system settings.',
      name: 'privacyChoicesItem2',
      desc: '',
      args: [],
    );
  }

  /// `You may withdraw consent for optional permissions at any time.`
  String get privacyChoicesItem3 {
    return Intl.message(
      'You may withdraw consent for optional permissions at any time.',
      name: 'privacyChoicesItem3',
      desc: '',
      args: [],
    );
  }

  /// `Data Security and Retention`
  String get privacySecurityTitle {
    return Intl.message(
      'Data Security and Retention',
      name: 'privacySecurityTitle',
      desc: '',
      args: [],
    );
  }

  /// `We use reasonable safeguards to protect data in transit and at rest.`
  String get privacySecurityItem1 {
    return Intl.message(
      'We use reasonable safeguards to protect data in transit and at rest.',
      name: 'privacySecurityItem1',
      desc: '',
      args: [],
    );
  }

  /// `We retain data only as long as necessary for the purposes described or as required by law.`
  String get privacySecurityItem2 {
    return Intl.message(
      'We retain data only as long as necessary for the purposes described or as required by law.',
      name: 'privacySecurityItem2',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get privacyContactTitle {
    return Intl.message(
      'Contact Us',
      name: 'privacyContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have questions or requests about this policy, contact support@nesti-fy.app.`
  String get privacyContactBody {
    return Intl.message(
      'If you have questions or requests about this policy, contact support@nesti-fy.app.',
      name: 'privacyContactBody',
      desc: '',
      args: [],
    );
  }

  /// `Last updated: Dec 2025`
  String get privacyLastUpdated {
    return Intl.message(
      'Last updated: Dec 2025',
      name: 'privacyLastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsTitle {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Nestify`
  String get termsWelcomeTitle {
    return Intl.message(
      'Welcome to Nestify',
      name: 'termsWelcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `By using our app, you agree to these terms. Please read them carefully.`
  String get termsWelcomeBody {
    return Intl.message(
      'By using our app, you agree to these terms. Please read them carefully.',
      name: 'termsWelcomeBody',
      desc: '',
      args: [],
    );
  }

  /// `Use of the App`
  String get termsUseTitle {
    return Intl.message(
      'Use of the App',
      name: 'termsUseTitle',
      desc: '',
      args: [],
    );
  }

  /// `You must be at least 18 years old or have guardian consent.`
  String get termsUseItem1 {
    return Intl.message(
      'You must be at least 18 years old or have guardian consent.',
      name: 'termsUseItem1',
      desc: '',
      args: [],
    );
  }

  /// `Provide accurate account information and keep credentials secure.`
  String get termsUseItem2 {
    return Intl.message(
      'Provide accurate account information and keep credentials secure.',
      name: 'termsUseItem2',
      desc: '',
      args: [],
    );
  }

  /// `Use the app only for lawful purposes and in accordance with these terms.`
  String get termsUseItem3 {
    return Intl.message(
      'Use the app only for lawful purposes and in accordance with these terms.',
      name: 'termsUseItem3',
      desc: '',
      args: [],
    );
  }

  /// `Orders and Payments`
  String get termsOrdersTitle {
    return Intl.message(
      'Orders and Payments',
      name: 'termsOrdersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Prices, fees, and availability may change without notice.`
  String get termsOrdersItem1 {
    return Intl.message(
      'Prices, fees, and availability may change without notice.',
      name: 'termsOrdersItem1',
      desc: '',
      args: [],
    );
  }

  /// `You authorize us to charge your selected payment method for purchases.`
  String get termsOrdersItem2 {
    return Intl.message(
      'You authorize us to charge your selected payment method for purchases.',
      name: 'termsOrdersItem2',
      desc: '',
      args: [],
    );
  }

  /// `Promotions and discount codes may have additional conditions.`
  String get termsOrdersItem3 {
    return Intl.message(
      'Promotions and discount codes may have additional conditions.',
      name: 'termsOrdersItem3',
      desc: '',
      args: [],
    );
  }

  /// `Content and Intellectual Property`
  String get termsContentTitle {
    return Intl.message(
      'Content and Intellectual Property',
      name: 'termsContentTitle',
      desc: '',
      args: [],
    );
  }

  /// `All app content is owned by us or our licensors and protected by law.`
  String get termsContentItem1 {
    return Intl.message(
      'All app content is owned by us or our licensors and protected by law.',
      name: 'termsContentItem1',
      desc: '',
      args: [],
    );
  }

  /// `You may not copy, modify, or distribute content without permission.`
  String get termsContentItem2 {
    return Intl.message(
      'You may not copy, modify, or distribute content without permission.',
      name: 'termsContentItem2',
      desc: '',
      args: [],
    );
  }

  /// `User-submitted content must not infringe others’ rights or be unlawful.`
  String get termsContentItem3 {
    return Intl.message(
      'User-submitted content must not infringe others’ rights or be unlawful.',
      name: 'termsContentItem3',
      desc: '',
      args: [],
    );
  }

  /// `Prohibited Conduct`
  String get termsProhibitedTitle {
    return Intl.message(
      'Prohibited Conduct',
      name: 'termsProhibitedTitle',
      desc: '',
      args: [],
    );
  }

  /// `No attempts to hack, disrupt, or reverse-engineer the app.`
  String get termsProhibitedItem1 {
    return Intl.message(
      'No attempts to hack, disrupt, or reverse-engineer the app.',
      name: 'termsProhibitedItem1',
      desc: '',
      args: [],
    );
  }

  /// `No harassment, fraud, or abusive behavior toward others.`
  String get termsProhibitedItem2 {
    return Intl.message(
      'No harassment, fraud, or abusive behavior toward others.',
      name: 'termsProhibitedItem2',
      desc: '',
      args: [],
    );
  }

  /// `No misuse of promotions, referrals, or return policies.`
  String get termsProhibitedItem3 {
    return Intl.message(
      'No misuse of promotions, referrals, or return policies.',
      name: 'termsProhibitedItem3',
      desc: '',
      args: [],
    );
  }

  /// `Liability`
  String get termsLiabilityTitle {
    return Intl.message(
      'Liability',
      name: 'termsLiabilityTitle',
      desc: '',
      args: [],
    );
  }

  /// `The app is provided “as is” without warranties of any kind to the maximum extent permitted by law.`
  String get termsLiabilityItem1 {
    return Intl.message(
      'The app is provided “as is” without warranties of any kind to the maximum extent permitted by law.',
      name: 'termsLiabilityItem1',
      desc: '',
      args: [],
    );
  }

  /// `We are not liable for indirect, incidental, or consequential damages.`
  String get termsLiabilityItem2 {
    return Intl.message(
      'We are not liable for indirect, incidental, or consequential damages.',
      name: 'termsLiabilityItem2',
      desc: '',
      args: [],
    );
  }

  /// `Your sole remedy for dissatisfaction is to stop using the app.`
  String get termsLiabilityItem3 {
    return Intl.message(
      'Your sole remedy for dissatisfaction is to stop using the app.',
      name: 'termsLiabilityItem3',
      desc: '',
      args: [],
    );
  }

  /// `Termination`
  String get termsTerminationTitle {
    return Intl.message(
      'Termination',
      name: 'termsTerminationTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may suspend or terminate access for violations of these terms or unlawful activity.`
  String get termsTerminationItem1 {
    return Intl.message(
      'We may suspend or terminate access for violations of these terms or unlawful activity.',
      name: 'termsTerminationItem1',
      desc: '',
      args: [],
    );
  }

  /// `You may stop using the app at any time; certain obligations may survive termination.`
  String get termsTerminationItem2 {
    return Intl.message(
      'You may stop using the app at any time; certain obligations may survive termination.',
      name: 'termsTerminationItem2',
      desc: '',
      args: [],
    );
  }

  /// `Changes to These Terms`
  String get termsChangesTitle {
    return Intl.message(
      'Changes to These Terms',
      name: 'termsChangesTitle',
      desc: '',
      args: [],
    );
  }

  /// `We may update these terms periodically. Continued use after changes means you accept the updated terms.`
  String get termsChangesBody {
    return Intl.message(
      'We may update these terms periodically. Continued use after changes means you accept the updated terms.',
      name: 'termsChangesBody',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get termsContactTitle {
    return Intl.message(
      'Contact Us',
      name: 'termsContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Questions about these terms? Contact support@nesti-fy.app.`
  String get termsContactBody {
    return Intl.message(
      'Questions about these terms? Contact support@nesti-fy.app.',
      name: 'termsContactBody',
      desc: '',
      args: [],
    );
  }

  /// `Last updated: Dec 2025`
  String get termsLastUpdated {
    return Intl.message(
      'Last updated: Dec 2025',
      name: 'termsLastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get aboutTitle {
    return Intl.message('About', name: 'aboutTitle', desc: '', args: []);
  }

  /// `Nestify`
  String get aboutAppName {
    return Intl.message('Nestify', name: 'aboutAppName', desc: '', args: []);
  }

  /// `Nestify helps you discover and furnish spaces you love with curated rooms, products, and inspiration.`
  String get aboutAppDesc {
    return Intl.message(
      'Nestify helps you discover and furnish spaces you love with curated rooms, products, and inspiration.',
      name: 'aboutAppDesc',
      desc: '',
      args: [],
    );
  }

  /// `Our Mission`
  String get aboutMissionTitle {
    return Intl.message(
      'Our Mission',
      name: 'aboutMissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Make home styling simple, delightful, and accessible by blending thoughtful design with seamless shopping.`
  String get aboutMissionBody {
    return Intl.message(
      'Make home styling simple, delightful, and accessible by blending thoughtful design with seamless shopping.',
      name: 'aboutMissionBody',
      desc: '',
      args: [],
    );
  }

  /// `What You Can Do`
  String get aboutWhatYouCanDoTitle {
    return Intl.message(
      'What You Can Do',
      name: 'aboutWhatYouCanDoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Browse curated rooms and categories for inspiration.`
  String get aboutWhatYouCanDoItem1 {
    return Intl.message(
      'Browse curated rooms and categories for inspiration.',
      name: 'aboutWhatYouCanDoItem1',
      desc: '',
      args: [],
    );
  }

  /// `Save items you love and build your bag effortlessly.`
  String get aboutWhatYouCanDoItem2 {
    return Intl.message(
      'Save items you love and build your bag effortlessly.',
      name: 'aboutWhatYouCanDoItem2',
      desc: '',
      args: [],
    );
  }

  /// `Manage your profile, addresses, and orders from one place.`
  String get aboutWhatYouCanDoItem3 {
    return Intl.message(
      'Manage your profile, addresses, and orders from one place.',
      name: 'aboutWhatYouCanDoItem3',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get aboutContactTitle {
    return Intl.message(
      'Contact',
      name: 'aboutContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Have feedback or need help? Reach us at support@nesti-fy.app.`
  String get aboutContactBody {
    return Intl.message(
      'Have feedback or need help? Reach us at support@nesti-fy.app.',
      name: 'aboutContactBody',
      desc: '',
      args: [],
    );
  }

  /// `Version 1.0.0`
  String get aboutVersion {
    return Intl.message(
      'Version 1.0.0',
      name: 'aboutVersion',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message('Settings', name: 'settingsTitle', desc: '', args: []);
  }

  /// `Notifications`
  String get settingsNotifications {
    return Intl.message(
      'Notifications',
      name: 'settingsNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settingsTheme {
    return Intl.message('Theme', name: 'settingsTheme', desc: '', args: []);
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get settingsPrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'settingsPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get settingsTerms {
    return Intl.message(
      'Terms and Conditions',
      name: 'settingsTerms',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingsAbout {
    return Intl.message('About', name: 'settingsAbout', desc: '', args: []);
  }

  /// `version 1.0.0`
  String get settingsVersion {
    return Intl.message(
      'version 1.0.0',
      name: 'settingsVersion',
      desc: '',
      args: [],
    );
  }

  /// `Choose Theme`
  String get settingsChooseTheme {
    return Intl.message(
      'Choose Theme',
      name: 'settingsChooseTheme',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get settingsChooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'settingsChooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settingsLight {
    return Intl.message('Light', name: 'settingsLight', desc: '', args: []);
  }

  /// `Dark`
  String get settingsDark {
    return Intl.message('Dark', name: 'settingsDark', desc: '', args: []);
  }

  /// `System`
  String get settingsSystem {
    return Intl.message('System', name: 'settingsSystem', desc: '', args: []);
  }

  /// `English`
  String get settingsEnglish {
    return Intl.message('English', name: 'settingsEnglish', desc: '', args: []);
  }

  /// `Arabic`
  String get settingsArabic {
    return Intl.message('Arabic', name: 'settingsArabic', desc: '', args: []);
  }

  /// `Admin Dashboard`
  String get adminDashboardTitle {
    return Intl.message(
      'Admin Dashboard',
      name: 'adminDashboardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Products`
  String get adminAddProducts {
    return Intl.message(
      'Add Products',
      name: 'adminAddProducts',
      desc: '',
      args: [],
    );
  }

  /// `Add Best Categories`
  String get adminAddBestCategories {
    return Intl.message(
      'Add Best Categories',
      name: 'adminAddBestCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add Rooms`
  String get adminAddRooms {
    return Intl.message('Add Rooms', name: 'adminAddRooms', desc: '', args: []);
  }

  /// `Add Room Categories`
  String get adminAddRoomCategories {
    return Intl.message(
      'Add Room Categories',
      name: 'adminAddRoomCategories',
      desc: '',
      args: [],
    );
  }

  /// `Add Promo Codes`
  String get adminAddPromoCodes {
    return Intl.message(
      'Add Promo Codes',
      name: 'adminAddPromoCodes',
      desc: '',
      args: [],
    );
  }

  /// `my account`
  String get accountMyAccount {
    return Intl.message(
      'my account',
      name: 'accountMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get accountMyOrders {
    return Intl.message(
      'My orders',
      name: 'accountMyOrders',
      desc: '',
      args: [],
    );
  }

  /// `My Details`
  String get accountMyDetails {
    return Intl.message(
      'My Details',
      name: 'accountMyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Address book`
  String get accountAddressBook {
    return Intl.message(
      'Address book',
      name: 'accountAddressBook',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get accountSetting {
    return Intl.message('Setting', name: 'accountSetting', desc: '', args: []);
  }

  /// `Logout`
  String get accountLogout {
    return Intl.message('Logout', name: 'accountLogout', desc: '', args: []);
  }

  /// `are you sure you want to sign out?`
  String get accountLogoutTitle {
    return Intl.message(
      'are you sure you want to sign out?',
      name: 'accountLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `We definitely don't want that`
  String get accountLogoutMessage {
    return Intl.message(
      'We definitely don\'t want that',
      name: 'accountLogoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `No, I want to stay`
  String get accountLogoutStay {
    return Intl.message(
      'No, I want to stay',
      name: 'accountLogoutStay',
      desc: '',
      args: [],
    );
  }

  /// `Yep, sign out`
  String get accountLogoutConfirm {
    return Intl.message(
      'Yep, sign out',
      name: 'accountLogoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addAddressTitle {
    return Intl.message(
      'Add New Address',
      name: 'addAddressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get addAddressStreet {
    return Intl.message('Street', name: 'addAddressStreet', desc: '', args: []);
  }

  /// `City`
  String get addAddressCity {
    return Intl.message('City', name: 'addAddressCity', desc: '', args: []);
  }

  /// `Country`
  String get addAddressCountry {
    return Intl.message(
      'Country',
      name: 'addAddressCountry',
      desc: '',
      args: [],
    );
  }

  /// `Street cannot be empty`
  String get addAddressStreetError {
    return Intl.message(
      'Street cannot be empty',
      name: 'addAddressStreetError',
      desc: '',
      args: [],
    );
  }

  /// `City cannot be empty`
  String get addAddressCityError {
    return Intl.message(
      'City cannot be empty',
      name: 'addAddressCityError',
      desc: '',
      args: [],
    );
  }

  /// `Country cannot be empty`
  String get addAddressCountryError {
    return Intl.message(
      'Country cannot be empty',
      name: 'addAddressCountryError',
      desc: '',
      args: [],
    );
  }

  /// `Save Address`
  String get addAddressSave {
    return Intl.message(
      'Save Address',
      name: 'addAddressSave',
      desc: '',
      args: [],
    );
  }

  /// `Address Book`
  String get addressBookTitle {
    return Intl.message(
      'Address Book',
      name: 'addressBookTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addressBookAddNew {
    return Intl.message(
      'Add New Address',
      name: 'addressBookAddNew',
      desc: '',
      args: [],
    );
  }

  /// `No addresses found.`
  String get addressBookNoAddresses {
    return Intl.message(
      'No addresses found.',
      name: 'addressBookNoAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Set up your profile`
  String get completeProfileTitle {
    return Intl.message(
      'Set up your profile',
      name: 'completeProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload or take a photo`
  String get completeProfileUploadPhoto {
    return Intl.message(
      'Upload or take a photo',
      name: 'completeProfileUploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get completeProfileFullName {
    return Intl.message(
      'Full Name',
      name: 'completeProfileFullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get completeProfilePhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'completeProfilePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get completeProfileAddress {
    return Intl.message(
      'Address',
      name: 'completeProfileAddress',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get completeProfileDateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'completeProfileDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `select birthdate`
  String get completeProfileSelectBirthdate {
    return Intl.message(
      'select birthdate',
      name: 'completeProfileSelectBirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Age must be at least 18 years old`
  String get completeProfileAgeError {
    return Intl.message(
      'Age must be at least 18 years old',
      name: 'completeProfileAgeError',
      desc: '',
      args: [],
    );
  }

  /// `Select your birthdate`
  String get completeProfileSelectBirthdateHelp {
    return Intl.message(
      'Select your birthdate',
      name: 'completeProfileSelectBirthdateHelp',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get completeProfileCancel {
    return Intl.message(
      'Close',
      name: 'completeProfileCancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get completeProfileConfirm {
    return Intl.message(
      'OK',
      name: 'completeProfileConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Complete Setup`
  String get completeProfileComplete {
    return Intl.message(
      'Complete Setup',
      name: 'completeProfileComplete',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get completeProfileNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'completeProfileNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get completeProfileCamera {
    return Intl.message(
      'Camera',
      name: 'completeProfileCamera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get completeProfileGallery {
    return Intl.message(
      'Gallery',
      name: 'completeProfileGallery',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password ?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password ?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and we will send you a password reset link.`
  String get forgotPasswordInstruction {
    return Intl.message(
      'Enter your email and we will send you a password reset link.',
      name: 'forgotPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get forgotPasswordEmail {
    return Intl.message(
      'Email',
      name: 'forgotPasswordEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get forgotPasswordSendLink {
    return Intl.message(
      'Send Reset Link',
      name: 'forgotPasswordSendLink',
      desc: '',
      args: [],
    );
  }

  /// `Tap again to resend the reset email.`
  String get forgotPasswordResendNow {
    return Intl.message(
      'Tap again to resend the reset email.',
      name: 'forgotPasswordResendNow',
      desc: '',
      args: [],
    );
  }

  /// `You can resend after`
  String get forgotPasswordResendAfter {
    return Intl.message(
      'You can resend after',
      name: 'forgotPasswordResendAfter',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get forgotPasswordNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'forgotPasswordNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent successfully. Please check your email.`
  String get forgotPasswordSuccess {
    return Intl.message(
      'Password reset link sent successfully. Please check your email.',
      name: 'forgotPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get forgotPasswordOk {
    return Intl.message('OK', name: 'forgotPasswordOk', desc: '', args: []);
  }

  /// `Nestify`
  String get loginTitle {
    return Intl.message('Nestify', name: 'loginTitle', desc: '', args: []);
  }

  /// `Welcome Back`
  String get loginWelcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'loginWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// ` ,If you don't have an account register You can `
  String get loginNoAccount {
    return Intl.message(
      ' ,If you don\'t have an account register You can ',
      name: 'loginNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register here !`
  String get loginRegisterHere {
    return Intl.message(
      'Register here !',
      name: 'loginRegisterHere',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginEmail {
    return Intl.message('Email', name: 'loginEmail', desc: '', args: []);
  }

  /// `Password`
  String get loginPassword {
    return Intl.message('Password', name: 'loginPassword', desc: '', args: []);
  }

  /// `Forgot password ?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot password ?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `or continue with`
  String get loginContinueWith {
    return Intl.message(
      'or continue with',
      name: 'loginContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get loginNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'loginNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `My Details`
  String get myDetailsTitle {
    return Intl.message(
      'My Details',
      name: 'myDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get myDetailsSave {
    return Intl.message('Save', name: 'myDetailsSave', desc: '', args: []);
  }

  /// `Profile updated successfully`
  String get myDetailsProfileUpdated {
    return Intl.message(
      'Profile updated successfully',
      name: 'myDetailsProfileUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get myDetailsChangePhoto {
    return Intl.message(
      'Change Profile Picture',
      name: 'myDetailsChangePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get myDetailsFullName {
    return Intl.message(
      'Full Name',
      name: 'myDetailsFullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get myDetailsEmail {
    return Intl.message('Email', name: 'myDetailsEmail', desc: '', args: []);
  }

  /// `Phone Number`
  String get myDetailsPhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'myDetailsPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get myDetailsDateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'myDetailsDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `select birthdate`
  String get myDetailsSelectBirthdate {
    return Intl.message(
      'select birthdate',
      name: 'myDetailsSelectBirthdate',
      desc: '',
      args: [],
    );
  }

  /// `Age must be at least 18 years old`
  String get myDetailsAgeError {
    return Intl.message(
      'Age must be at least 18 years old',
      name: 'myDetailsAgeError',
      desc: '',
      args: [],
    );
  }

  /// `Select your birthdate`
  String get myDetailsSelectBirthdateHelp {
    return Intl.message(
      'Select your birthdate',
      name: 'myDetailsSelectBirthdateHelp',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get myDetailsCancel {
    return Intl.message('Close', name: 'myDetailsCancel', desc: '', args: []);
  }

  /// `OK`
  String get myDetailsConfirm {
    return Intl.message('OK', name: 'myDetailsConfirm', desc: '', args: []);
  }

  /// `Camera`
  String get myDetailsCamera {
    return Intl.message('Camera', name: 'myDetailsCamera', desc: '', args: []);
  }

  /// `Gallery`
  String get myDetailsGallery {
    return Intl.message(
      'Gallery',
      name: 'myDetailsGallery',
      desc: '',
      args: [],
    );
  }

  /// `User orders will be shown here.`
  String get myOrdersMessage {
    return Intl.message(
      'User orders will be shown here.',
      name: 'myOrdersMessage',
      desc: '',
      args: [],
    );
  }

  /// `Nestify`
  String get registerTitle {
    return Intl.message('Nestify', name: 'registerTitle', desc: '', args: []);
  }

  /// `Create Your Account`
  String get registerCreateAccount {
    return Intl.message(
      'Create Your Account',
      name: 'registerCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// ` ,If you already have an account register You can `
  String get registerHaveAccount {
    return Intl.message(
      ' ,If you already have an account register You can ',
      name: 'registerHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login here !`
  String get registerLoginHere {
    return Intl.message(
      'Login here !',
      name: 'registerLoginHere',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get registerEmail {
    return Intl.message('Email', name: 'registerEmail', desc: '', args: []);
  }

  /// `Password`
  String get registerPassword {
    return Intl.message(
      'Password',
      name: 'registerPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get registerConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'registerConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get registerConfirmPasswordError {
    return Intl.message(
      'Please confirm your password',
      name: 'registerConfirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get registerPasswordsNoMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'registerPasswordsNoMatch',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message('Register', name: 'registerButton', desc: '', args: []);
  }

  /// `No Internet Connection`
  String get registerNoInternet {
    return Intl.message(
      'No Internet Connection',
      name: 'registerNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Registration Successful check your email to verify your account`
  String get registerSuccess {
    return Intl.message(
      'Registration Successful check your email to verify your account',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get registerOk {
    return Intl.message('OK', name: 'registerOk', desc: '', args: []);
  }

  /// `At least 6 characters`
  String get registerRuleMinLength {
    return Intl.message(
      'At least 6 characters',
      name: 'registerRuleMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Contains an uppercase letter`
  String get registerRuleUpperCase {
    return Intl.message(
      'Contains an uppercase letter',
      name: 'registerRuleUpperCase',
      desc: '',
      args: [],
    );
  }

  /// `Contains a number`
  String get registerRuleNumber {
    return Intl.message(
      'Contains a number',
      name: 'registerRuleNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contains a special character`
  String get registerRuleSpecialChar {
    return Intl.message(
      'Contains a special character',
      name: 'registerRuleSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `bag`
  String get bagTitle {
    return Intl.message('bag', name: 'bagTitle', desc: '', args: []);
  }

  /// `Promo Code`
  String get bagPromoCode {
    return Intl.message('Promo Code', name: 'bagPromoCode', desc: '', args: []);
  }

  /// `Code`
  String get bagPromoCodeHint {
    return Intl.message('Code', name: 'bagPromoCodeHint', desc: '', args: []);
  }

  /// `Continue`
  String get bagContinue {
    return Intl.message('Continue', name: 'bagContinue', desc: '', args: []);
  }

  /// `Total`
  String get bagTotal {
    return Intl.message('Total', name: 'bagTotal', desc: '', args: []);
  }

  /// `Promocode`
  String get bagPromocode {
    return Intl.message('Promocode', name: 'bagPromocode', desc: '', args: []);
  }

  /// `final total`
  String get bagFinalTotal {
    return Intl.message(
      'final total',
      name: 'bagFinalTotal',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkoutTitle {
    return Intl.message('Checkout', name: 'checkoutTitle', desc: '', args: []);
  }

  /// `Step`
  String get checkoutStep {
    return Intl.message('Step', name: 'checkoutStep', desc: '', args: []);
  }

  /// `of`
  String get checkoutOf {
    return Intl.message('of', name: 'checkoutOf', desc: '', args: []);
  }

  /// `Contact info`
  String get checkoutContactInfo {
    return Intl.message(
      'Contact info',
      name: 'checkoutContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get checkoutFullName {
    return Intl.message(
      'Full name',
      name: 'checkoutFullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get checkoutPhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'checkoutPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get checkoutEmail {
    return Intl.message('Email', name: 'checkoutEmail', desc: '', args: []);
  }

  /// `Next`
  String get checkoutNext {
    return Intl.message('Next', name: 'checkoutNext', desc: '', args: []);
  }

  /// `delivery method`
  String get checkoutDeliveryMethod {
    return Intl.message(
      'delivery method',
      name: 'checkoutDeliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `By courier`
  String get checkoutByCourier {
    return Intl.message(
      'By courier',
      name: 'checkoutByCourier',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow, any time`
  String get checkoutCourierTime {
    return Intl.message(
      'Tomorrow, any time',
      name: 'checkoutCourierTime',
      desc: '',
      args: [],
    );
  }

  /// `I'll take it myself`
  String get checkoutPickup {
    return Intl.message(
      'I\'ll take it myself',
      name: 'checkoutPickup',
      desc: '',
      args: [],
    );
  }

  /// `Any day from tomorrow`
  String get checkoutPickupTime {
    return Intl.message(
      'Any day from tomorrow',
      name: 'checkoutPickupTime',
      desc: '',
      args: [],
    );
  }

  /// `delivery address`
  String get checkoutDeliveryAddress {
    return Intl.message(
      'delivery address',
      name: 'checkoutDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `delivery time`
  String get checkoutDeliveryTime {
    return Intl.message(
      'delivery time',
      name: 'checkoutDeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get checkoutContinue {
    return Intl.message(
      'Continue',
      name: 'checkoutContinue',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get checkoutPaymentMethod {
    return Intl.message(
      'Payment method',
      name: 'checkoutPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get checkoutPay {
    return Intl.message('Pay', name: 'checkoutPay', desc: '', args: []);
  }

  /// `#`
  String get orderSuccessOrderId {
    return Intl.message('#', name: 'orderSuccessOrderId', desc: '', args: []);
  }

  /// `your order is placed`
  String get orderSuccessTitle {
    return Intl.message(
      'your order is placed',
      name: 'orderSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `thanks for your order, we hope you enjoyed shopping with us`
  String get orderSuccessMessage {
    return Intl.message(
      'thanks for your order, we hope you enjoyed shopping with us',
      name: 'orderSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `To home`
  String get orderSuccessToHome {
    return Intl.message(
      'To home',
      name: 'orderSuccessToHome',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
