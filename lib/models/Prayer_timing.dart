import 'package:flutter/foundation.dart';

@immutable
class PrayerTiming {

  const PrayerTiming({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final List<Datum> data;

  factory PrayerTiming.fromJson(Map<String,dynamic> json) => PrayerTiming(
    code: json['code'] as int,
    status: json['status'].toString(),
    data: (json['data'] as List? ?? []).map((e) => Datum.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'data': data.map((e) => e.toJson()).toList()
  };

  PrayerTiming clone() => PrayerTiming(
    code: code,
    status: status,
    data: data.map((e) => e.clone()).toList()
  );


  PrayerTiming copyWith({
    int? code,
    String? status,
    List<Datum>? data
  }) => PrayerTiming(
    code: code ?? this.code,
    status: status ?? this.status,
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PrayerTiming && code == other.code && status == other.status && data == other.data;

  @override
  int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}

@immutable
class Datum {

  const Datum({
    required this.timings,
    required this.date,
    });

  final Timings timings;
  final Date date;


  factory Datum.fromJson(Map<String,dynamic> json) => Datum(
    timings: Timings.fromJson(json['timings'] as Map<String, dynamic>),
    date: Date.fromJson(json['date'] as Map<String, dynamic>),

  );
  
  Map<String, dynamic> toJson() => {
    'timings': timings.toJson(),
    'date': date.toJson(),
   
  };

  Datum clone() => Datum(
    timings: timings.clone(),
    date: date.clone(),
  
  );

}

@immutable
class Timings {

  const Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstthird;
  final String lastthird;

  factory Timings.fromJson(Map<String,dynamic> json) => Timings(
    fajr: json['Fajr'].toString(),
    sunrise: json['Sunrise'].toString(),
    dhuhr: json['Dhuhr'].toString(),
    asr: json['Asr'].toString(),
    sunset: json['Sunset'].toString(),
    maghrib: json['Maghrib'].toString(),
    isha: json['Isha'].toString(),
    imsak: json['Imsak'].toString(),
    midnight: json['Midnight'].toString(),
    firstthird: json['Firstthird'].toString(),
    lastthird: json['Lastthird'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'Fajr': fajr,
    'Sunrise': sunrise,
    'Dhuhr': dhuhr,
    'Asr': asr,
    'Sunset': sunset,
    'Maghrib': maghrib,
    'Isha': isha,
    'Imsak': imsak,
    'Midnight': midnight,
    'Firstthird': firstthird,
    'Lastthird': lastthird
  };

  Timings clone() => Timings(
    fajr: fajr,
    sunrise: sunrise,
    dhuhr: dhuhr,
    asr: asr,
    sunset: sunset,
    maghrib: maghrib,
    isha: isha,
    imsak: imsak,
    midnight: midnight,
    firstthird: firstthird,
    lastthird: lastthird
  );


  Timings copyWith({
    String? fajr,
    String? sunrise,
    String? dhuhr,
    String? asr,
    String? sunset,
    String? maghrib,
    String? isha,
    String? imsak,
    String? midnight,
    String? firstthird,
    String? lastthird
  }) => Timings(
    fajr: fajr ?? this.fajr,
    sunrise: sunrise ?? this.sunrise,
    dhuhr: dhuhr ?? this.dhuhr,
    asr: asr ?? this.asr,
    sunset: sunset ?? this.sunset,
    maghrib: maghrib ?? this.maghrib,
    isha: isha ?? this.isha,
    imsak: imsak ?? this.imsak,
    midnight: midnight ?? this.midnight,
    firstthird: firstthird ?? this.firstthird,
    lastthird: lastthird ?? this.lastthird,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Timings && fajr == other.fajr && sunrise == other.sunrise && dhuhr == other.dhuhr && asr == other.asr && sunset == other.sunset && maghrib == other.maghrib && isha == other.isha && imsak == other.imsak && midnight == other.midnight && firstthird == other.firstthird && lastthird == other.lastthird;

  @override
  int get hashCode => fajr.hashCode ^ sunrise.hashCode ^ dhuhr.hashCode ^ asr.hashCode ^ sunset.hashCode ^ maghrib.hashCode ^ isha.hashCode ^ imsak.hashCode ^ midnight.hashCode ^ firstthird.hashCode ^ lastthird.hashCode;
}

@immutable
class Date {

  const Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  final String readable;
  final String timestamp;
  final Gregorian gregorian;
  final Hijri hijri;

  factory Date.fromJson(Map<String,dynamic> json) => Date(
    readable: json['readable'].toString(),
    timestamp: json['timestamp'].toString(),
    gregorian: Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
    hijri: Hijri.fromJson(json['hijri'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'readable': readable,
    'timestamp': timestamp,
    'gregorian': gregorian.toJson(),
    'hijri': hijri.toJson()
  };

  Date clone() => Date(
    readable: readable,
    timestamp: timestamp,
    gregorian: gregorian.clone(),
    hijri: hijri.clone()
  );


  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri
  }) => Date(
    readable: readable ?? this.readable,
    timestamp: timestamp ?? this.timestamp,
    gregorian: gregorian ?? this.gregorian,
    hijri: hijri ?? this.hijri,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Date && readable == other.readable && timestamp == other.timestamp && gregorian == other.gregorian && hijri == other.hijri;

  @override
  int get hashCode => readable.hashCode ^ timestamp.hashCode ^ gregorian.hashCode ^ hijri.hashCode;
}

@immutable
class Gregorian {

  const Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;

  factory Gregorian.fromJson(Map<String,dynamic> json) => Gregorian(
    date: json['date'].toString(),
    format: json['format'].toString(),
    day: json['day'].toString(),
    weekday: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
    month: Month.fromJson(json['month'] as Map<String, dynamic>),
    year: json['year'].toString(),
    designation: Designation.fromJson(json['designation'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday.toJson(),
    'month': month.toJson(),
    'year': year,
    'designation': designation.toJson()
  };

  Gregorian clone() => Gregorian(
    date: date,
    format: format,
    day: day,
    weekday: weekday.clone(),
    month: month.clone(),
    year: year,
    designation: designation.clone()
  );


  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation
  }) => Gregorian(
    date: date ?? this.date,
    format: format ?? this.format,
    day: day ?? this.day,
    weekday: weekday ?? this.weekday,
    month: month ?? this.month,
    year: year ?? this.year,
    designation: designation ?? this.designation,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Gregorian && date == other.date && format == other.format && day == other.day && weekday == other.weekday && month == other.month && year == other.year && designation == other.designation;

  @override
  int get hashCode => date.hashCode ^ format.hashCode ^ day.hashCode ^ weekday.hashCode ^ month.hashCode ^ year.hashCode ^ designation.hashCode;
}

@immutable
class Weekday {

  const Weekday({
    required this.en,
  });

  final String en;

  factory Weekday.fromJson(Map<String,dynamic> json) => Weekday(
    en: json['en'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'en': en
  };

  Weekday clone() => Weekday(
    en: en
  );


  Weekday copyWith({
    String? en
  }) => Weekday(
    en: en ?? this.en,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Weekday && en == other.en;

  @override
  int get hashCode => en.hashCode;
}

@immutable
class Month {

  const Month({
    required this.number,
    required this.en,
  });

  final int number;
  final String en;

  factory Month.fromJson(Map<String,dynamic> json) => Month(
    number: json['number'] as int,
    en: json['en'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'number': number,
    'en': en
  };

  Month clone() => Month(
    number: number,
    en: en
  );


  Month copyWith({
    int? number,
    String? en
  }) => Month(
    number: number ?? this.number,
    en: en ?? this.en,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Month && number == other.number && en == other.en;

  @override
  int get hashCode => number.hashCode ^ en.hashCode;
}

@immutable
class Designation {

  const Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String abbreviated;
  final String expanded;

  factory Designation.fromJson(Map<String,dynamic> json) => Designation(
    abbreviated: json['abbreviated'].toString(),
    expanded: json['expanded'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'abbreviated': abbreviated,
    'expanded': expanded
  };

  Designation clone() => Designation(
    abbreviated: abbreviated,
    expanded: expanded
  );


  Designation copyWith({
    String? abbreviated,
    String? expanded
  }) => Designation(
    abbreviated: abbreviated ?? this.abbreviated,
    expanded: expanded ?? this.expanded,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Designation && abbreviated == other.abbreviated && expanded == other.expanded;

  @override
  int get hashCode => abbreviated.hashCode ^ expanded.hashCode;
}

@immutable
class Hijri {

  const Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;

  factory Hijri.fromJson(Map<String,dynamic> json) => Hijri(
    date: json['date'].toString(),
    format: json['format'].toString(),
    day: json['day'].toString(),
    weekday: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
    month: Month.fromJson(json['month'] as Map<String, dynamic>),
    year: json['year'].toString(),
    designation: Designation.fromJson(json['designation'] as Map<String, dynamic>),
    holidays: (json['holidays'] as List? ?? []).map((e) => e as dynamic).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'date': date,
    'format': format,
    'day': day,
    'weekday': weekday.toJson(),
    'month': month.toJson(),
    'year': year,
    'designation': designation.toJson(),
    'holidays': holidays.map((e) => e.toString()).toList()
  };

  Hijri clone() => Hijri(
    date: date,
    format: format,
    day: day,
    weekday: weekday.clone(),
    month: month.clone(),
    year: year,
    designation: designation.clone(),
    holidays: holidays.toList()
  );


  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
    List<dynamic>? holidays
  }) => Hijri(
    date: date ?? this.date,
    format: format ?? this.format,
    day: day ?? this.day,
    weekday: weekday ?? this.weekday,
    month: month ?? this.month,
    year: year ?? this.year,
    designation: designation ?? this.designation,
    holidays: holidays ?? this.holidays,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Hijri && date == other.date && format == other.format && day == other.day && weekday == other.weekday && month == other.month && year == other.year && designation == other.designation && holidays == other.holidays;

  @override
  int get hashCode => date.hashCode ^ format.hashCode ^ day.hashCode ^ weekday.hashCode ^ month.hashCode ^ year.hashCode ^ designation.hashCode ^ holidays.hashCode;
}

