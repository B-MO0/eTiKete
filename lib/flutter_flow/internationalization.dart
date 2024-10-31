import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'r856umnk': {
      'en': 'eTiKete',
      'id': '',
      'ms': '',
    },
    'bmm6w0kk': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
    'lyfee57k': {
      'en': 'About',
      'id': '',
      'ms': '',
    },
    'kbb53ynq': {
      'en': 'Contact Us',
      'id': '',
      'ms': '',
    },
    '6aekhg5v': {
      'en': 'Donate !',
      'id': '',
      'ms': '',
    },
    '3owcr3t1': {
      'en': 'Your Event, Your Ticket, Instantly QR-Ready!',
      'id': '',
      'ms': '',
    },
    'tbp470z9': {
      'en': 'Create, Share, and Scan – All in One Place!',
      'id': '',
      'ms': '',
    },
    'ye9mkdqf': {
      'en': 'Sign in with Google Account',
      'id': '',
      'ms': '',
    },
    '5pggrs0q': {
      'en': '100%',
      'id': '',
      'ms': '',
    },
    'cab1wqo5': {
      'en': 'Completly\nFree',
      'id': '',
      'ms': '',
    },
    '85hbq6qx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Below is a summary of your activity.',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    '28ggdsf3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'jqevo63s': {
      'en': 'free Space in google drive',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    '87avgrz9': {
      'en': ' % ',
      'id': '',
      'ms': '',
    },
    'hwo4p4p4': {
      'en': 'of free space on your drive .',
      'id': '',
      'ms': '',
    },
    '8vot9bzj': {
      'en': ' Online Events',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    'saxskj92': {
      'en': 'Total Tickets Created',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    'umh53lbz': {
      'en': 'Create new Event :',
      'id': '',
      'ms': '',
    },
    '6olynbzf': {
      'en': 'Event Name',
      'id': '',
      'ms': '',
    },
    'prdvh1ov': {
      'en': 'Please enter event name...',
      'id': '',
      'ms': '',
    },
    'kb400y93': {
      'en': 'Create',
      'id': '',
      'ms': '',
    },
    'vu0b9hg1': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'm7d84wpy': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'xlzf8qqx': {
      'en': 'My events :',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'zt3s5l2s': {
      'en': '4 Members',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // EventPage
  {
    'n99lg1qh': {
      'en': 'Event :',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'ma77x67w': {
      'en': 'choose ticket design :',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'mqzgwqxq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'qod3i4sf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'q358g84o': {
      'en': 'Create a ticket :',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'su536x4h': {
      'en': 'First Name ...',
      'id': '',
      'ms': '',
    },
    'j1s38itw': {
      'en': 'Last Name ...',
      'id': '',
      'ms': '',
    },
    '7mmjuo40': {
      'en': 'Email ...',
      'id': '',
      'ms': '',
    },
    '0zg8qe4w': {
      'en': 'Add ticket',
      'id': '',
      'ms': '',
    },
    'ltun036t': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'whsrgh3r': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'kht44sby': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'a7wbbgv9': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '05tf73pa': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '1x7o4bpw': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'ai25nob0': {
      'en': 'Tickets:',
      'id': '',
      'ms': '',
    },
    '32c6oale': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
    'i17120v6': {
      'en': 'Mail',
      'id': '',
      'ms': '',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Complete_Profile
  {
    'qrxn5crt': {
      'en': 'Complete Profile',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'fyxsf6vn': {
      'en':
          'Please complete your profile and provide consent to begin using eTiKete.',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    '1btinzv1': {
      'en': 'Phone number *',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'rl8ugf4u': {
      'en': 'Enter your phone number here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'p0lcsnmt': {
      'en': 'Address *',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'qvxxuqtm': {
      'en': 'Enter your address here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'az1ot3qi': {
      'en': 'Student',
      'id': '',
      'ms': '',
    },
    '9hbi3y8q': {
      'en': 'Teacher',
      'id': '',
      'ms': '',
    },
    '4vr6bzvi': {
      'en': 'Business owner',
      'id': '',
      'ms': '',
    },
    '2e5ffx8e': {
      'en': 'Profession *',
      'id': '',
      'ms': '',
    },
    'hsmzomiy': {
      'en': 'Search...',
      'id': '',
      'ms': '',
    },
    '947xyt76': {
      'en':
          'Welcome to eTiKete. By using this app, you agree to grant permissions for specific Google APIs, including Drive, Apps Script, Slides, and Sheets, to enable seamless functionality. These permissions allow us to create, edit, and modify files within a designated folder in your Google Drive, which the app will establish upon setup. Rest assured, we will only access and manage files within this folder; no data outside this folder will be accessible or modified by us.\n\nTo proceed, please review and accept these terms by checking the box below and clicking the \"Consent\" button to authorize permissions. Enjoy your experience with etikete!',
      'id': '',
      'ms': '',
    },
    '2aw8y7we': {
      'en': 'I agree to the terms of service .',
      'id': '',
      'ms': '',
    },
    'dsptby19': {
      'en': 'Grant all permissions ',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'gg4g5xcv': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '6ra05afg': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'mo1t3ldy': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'l7nlv9nc': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Profile
  {
    'jfsyzxgp': {
      'en': 'My Profile',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'jsa0o5x4': {
      'en': 'Profile informations',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'b4wwn2hn': {
      'en': 'Phone number :',
      'id': '',
      'ms': '',
    },
    '5bc9h9xt': {
      'en': 'Please enter your new phone number ...',
      'id': '',
      'ms': '',
    },
    '25wplaii': {
      'en': 'Address :',
      'id': '',
      'ms': '',
    },
    'affs6cpb': {
      'en': 'Please enter your new address ...',
      'id': '',
      'ms': '',
    },
    'fxm8bf5d': {
      'en': 'Birth date :',
      'id': '',
      'ms': '',
    },
    'okpco0lx': {
      'en': 'dd/mm/year',
      'id': '',
      'ms': '',
    },
    'c318e2xs': {
      'en': 'Push Profile Changes',
      'id': '',
      'ms': '',
    },
    '4v40f6a1': {
      'en': 'Log Out',
      'id': '',
      'ms': '',
    },
    '82j775d2': {
      'en': 'Delete Account',
      'id': '',
      'ms': '',
    },
    '4bpetcjv': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'id': 'Ricky Rodriguez',
      'ms': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'farrki57': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
  },
  // webNav
  {
    'b8i4mxtm': {
      'en': 'eTiKete',
      'id': '',
      'ms': '',
    },
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '01nu9cy0': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
    'bampnkmo': {
      'en': 'Log out',
      'id': '',
      'ms': '',
    },
  },
  // commandPalette
  {
    'jt9g5o8v': {
      'en': 'Search platform...',
      'id': 'Cari platform...',
      'ms': 'Platform carian...',
    },
    'b3bd9y8w': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'pw6kvl1f': {
      'en': 'Quick Links',
      'id': 'tautan langsung',
      'ms': 'Pautan Pantas',
    },
    'gckukxjv': {
      'en': 'Find Contract',
      'id': 'Temukan Kontrak',
      'ms': 'Cari Kontrak',
    },
    'zsq8vj02': {
      'en': 'Find Customer',
      'id': 'Temukan Pelanggan',
      'ms': 'Cari Pelanggan',
    },
    'iqxwv326': {
      'en': 'New Contract',
      'id': 'Kontrak baru',
      'ms': 'Kontrak Baru',
    },
    's60yfg0g': {
      'en': 'New Customer',
      'id': 'Pelanggan baru',
      'ms': 'Pelanggan baru',
    },
    'lwrh59bb': {
      'en': 'Recent Searches',
      'id': 'pencarian terkini',
      'ms': 'Carian Terkini',
    },
    'o6lqlfr1': {
      'en': 'Newport Financ',
      'id': 'Keuangan Newport',
      'ms': 'Kewangan Newport',
    },
    '6zpaywwg': {
      'en': 'Harry Styles',
      'id': 'Harry Styles',
      'ms': 'gaya Harry',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
  },
  // card
  {
    '8g6ovalp': {
      'en': 'Delete',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    '8yn439h4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'sip6xr0g': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '11b9f8of': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ajiysmy2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wj90kolt': {
      'en': '',
      'id': '',
      'ms': '',
    },
    's1umpwee': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'b0uo8thk': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
