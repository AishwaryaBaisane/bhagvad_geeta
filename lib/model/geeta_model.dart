
List ai = [
  {
    "Chapter": 1,
    "ChapterName": {
      "Hindi": "अर्जुन विषाद योग",
      "English": "The Yoga of Arjuna's Dejection",
      "Gujarati": "અર્જુન વિસાદ યોગ",
      "Sanskrit": "अर्जुनविषादयोगः"
    },
    "Verses": [
      {
        "VerseNumber": 1,
        "Text": {
          "Sanskrit":
              "धृतराष्ट्र उवाच | धर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः | मामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय || 1-1 ||",
          "Hindi":
              "धृतराष्ट्र ने कहा: धर्मक्षेत्र कुरुक्षेत्र में इकट्ठे हुए युद्ध की इच्छा करने वाले मेरे और पाण्डवों के पुत्रों ने क्या किया?",
          "Gujarati":
              "ધૃતરાષ્ટ્ર બોલ્યા: ધર્મક્ષેત્ર કુરુક્ષેત્રે યુદ્ધ કરવાને ઇચ્છતા મારા અને પાંડવોના પુત્રોએ શું કર્યું?",
          "English":
              "Dhritarashtra said: O Sanjaya, assembled in the holy land of Kurukshetra and desiring to fight, what did my sons and the sons of Pandu do?"
        }
      },
    ],
  },
];

class GitaModal {
  late int chapter;
  late List<Verses> verses;
  late ChapterName chapterName;

  GitaModal(
      {required this.chapter, required this.verses, required this.chapterName});

  factory GitaModal.fromJson(Map m1) {
    return GitaModal(
      chapter: m1['Chapter'],
      verses: (m1['Verses'] as List)
          .map(
            (e) => Verses.fromJson(e),
          )
          .toList(),
      chapterName: ChapterName.fromJson(m1['ChapterName']),
    );
  }
}

class ChapterName {
  late String Hindi, English, Gujarati, Sanskrit;

  ChapterName(
      {required this.Sanskrit,
      required this.Gujarati,
      required this.Hindi,
      required this.English});

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        Sanskrit: m1['Sanskrit'],
        Hindi: m1['Hindi'],
        English: m1['English'],
        Gujarati: m1['Gujarati']);
  }
}

class Verses {
  late int verseNumber;
  late Language language;

  Verses({required this.verseNumber, required this.language});

  factory Verses.fromJson(Map m1) {
    return Verses(
        verseNumber: m1['VerseNumber'],
        language: Language.fromJson(m1['Text']));
  }
}

class Language {
  late String Sanskrit, Hindi, English, Gujarati;

  Language(
      {required this.Sanskrit,
      required this.Gujarati,
      required this.English,
      required this.Hindi});

  factory Language.fromJson(Map m1) {
    return Language(
        Sanskrit: m1['Sanskrit'],
        Hindi: m1['Hindi'],
        English: m1['English'],
        Gujarati: m1['Gujarati']);
  }
}
