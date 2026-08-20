import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadMassiveLocalizedVaultData() async {
  final firestore = FirebaseFirestore.instance;

  final Map<String, dynamic> vaultGameData = {
    "id": "the_vault",
    "name": {
      "en": "The Vault",
      "ar": "الخزنة"
    },
    "version": 1, 
    "timerSeconds": 7,
    "questions": [
      // ==========================================
      // 1. Math & Operations (عمليات حسابية)
      // ==========================================
      {
        "instruction": {"en": "Calculate quickly", "ar": "احسب بسرعة"},
        "clue": {"en": "5 + 2 x 3", "ar": "5 + 2 x 3"},
        "answer": "11", 
        "hint": {"en": "Multiply first!", "ar": "الضرب يسبق الجمع!"}
      },
      {
        "instruction": {"en": "Solve the equation", "ar": "حل المعادلة"},
        "clue": {"en": "100 / 2 + 50", "ar": "100 / 2 + 50"},
        "answer": "100",
        "hint": {"en": "Division first", "ar": "القسمة أولاً"}
      },
      {
        "instruction": {"en": "Find the square root", "ar": "أوجد الجذر التربيعي"},
        "clue": {"en": "√144", "ar": "√144"},
        "answer": "12",
        "hint": {"en": "12 x 12", "ar": "12 مضروبة في نفسها"}
      },
      {
        "instruction": {"en": "Find the missing number", "ar": "أوجد الرقم الناقص"},
        "clue": {"en": "X + 15 = 40", "ar": "س + 15 = 40"},
        "answer": "25",
        "hint": {"en": "40 - 15", "ar": "اطرح 15 من 40"}
      },

      // ==========================================
      // 2. Sequences (المتسلسلات والأنماط)
      // ==========================================
      {
        "instruction": {"en": "Complete the sequence", "ar": "أكمل المتسلسلة"},
        "clue": {"en": "2 - 4 - 8 - 16 - [?]", "ar": "2 - 4 - 8 - 16 - [?]"},
        "answer": "32",
        "hint": {"en": "Multiply by 2", "ar": "اضرب في 2"}
      },
      {
        "instruction": {"en": "Find the next pattern", "ar": "استنتج النمط التالي"},
        "clue": {"en": "100 - 81 - 64 - 49 - [?]", "ar": "100 - 81 - 64 - 49 - [?]"},
        "answer": "36",
        "hint": {"en": "Perfect squares descending", "ar": "مربعات الأرقام تنازلياً"}
      },
      {
        "instruction": {"en": "Next prime number", "ar": "الرقم الأولي التالي"},
        "clue": {"en": "2 - 3 - 5 - 7 - 11 - [?]", "ar": "2 - 3 - 5 - 7 - 11 - [?]"},
        "answer": "13",
        "hint": {"en": "Numbers divisible only by 1 and themselves", "ar": "أرقام تقبل القسمة على نفسها والواحد فقط"}
      },
      {
        "instruction": {"en": "Fibonacci sequence", "ar": "متسلسلة فيبوناتشي"},
        "clue": {"en": "1 - 1 - 2 - 3 - 5 - [?]", "ar": "1 - 1 - 2 - 3 - 5 - [?]"},
        "answer": "8",
        "hint": {"en": "Sum of the previous two numbers", "ar": "مجموع آخر رقمين"}
      },

      // ==========================================
      // 3. Logic & Word-to-Number (منطق وحروف)
      // ==========================================
      {
        "instruction": {"en": "Count the letters", "ar": "عد الحروف"},
        "clue": {"en": "F L U T T E R", "ar": "ف ل ا ت ر"},
        "answer": "7", 
        "hint": {"en": "Just count them", "ar": "عد الحروف المكتوبة"}
      },
      {
        "instruction": {"en": "Alphabet position", "ar": "ترتيب الحرف أبجدياً"},
        "clue": {"en": "A=1, B=2, C=3, Z=[?]", "ar": "أ=1, ب=2, ي=[?]"},
        "answer": "26", 
        "hint": {"en": "Last letter of the alphabet", "ar": "آخر حرف في الحروف"}
      },
      {
        "instruction": {"en": "How many vowels?", "ar": "كم عدد النقاط؟"},
        "clue": {"en": "E X C E P T I O N", "ar": "ت ط ب ي ق"},
        "answer": "4", 
        "hint": {"en": "A, E, I, O, U", "ar": "عد النقاط على الحروف"}
      },

      // ==========================================
      // 4. Tech & Coding (تشفير برمجيات)
      // ==========================================
      {
        "instruction": {"en": "Binary to Decimal", "ar": "حول من ثنائي لعشري"},
        "clue": {"en": "1010", "ar": "1010"},
        "answer": "10",
        "hint": {"en": "8 + 0 + 2 + 0", "ar": "8 + 0 + 2 + 0"}
      },
      {
        "instruction": {"en": "Binary to Decimal", "ar": "حول من ثنائي لعشري"},
        "clue": {"en": "111", "ar": "111"},
        "answer": "7",
        "hint": {"en": "4 + 2 + 1", "ar": "4 + 2 + 1"}
      },
      {
        "instruction": {"en": "Hex to Decimal", "ar": "حول من سداسي عشر لعشري"},
        "clue": {"en": "F", "ar": "F"},
        "answer": "15",
        "hint": {"en": "Last single hex digit", "ar": "آخر رقم فردي في الـ Hex"}
      },

      // ==========================================
      // 5. Trivia & General Knowledge (معلومات عامة)
      // ==========================================
      {
        "instruction": {"en": "Fact check", "ar": "معلومة سريعة"},
        "clue": {"en": "Days in a leap year", "ar": "عدد أيام السنة الكبيسة"},
        "answer": "366",
        "hint": {"en": "February has 29 days", "ar": "فبراير فيه 29 يوم"}
      },
      {
        "instruction": {"en": "Fact check", "ar": "معلومة سريعة"},
        "clue": {"en": "Colors in a rainbow", "ar": "عدد ألوان قوس قزح"},
        "answer": "7",
        "hint": {"en": "ROYGBIV", "ar": "أحمر، برتقالي، أصفر..."}
      },
      {
        "instruction": {"en": "Geometry", "ar": "هندسة"},
        "clue": {"en": "Degrees in a full circle", "ar": "الدرجات في الدائرة الكاملة"},
        "answer": "360",
        "hint": {"en": "Full rotation", "ar": "دورة كاملة"}
      },
      {
        "instruction": {"en": "Time conversion", "ar": "تحويل وقت"},
        "clue": {"en": "Minutes in 3 hours", "ar": "الدقائق في 3 ساعات"},
        "answer": "180",
        "hint": {"en": "3 x 60", "ar": "3 مضروبة في 60"}
      },
      {
        "instruction": {"en": "Biology", "ar": "أحياء"},
        "clue": {"en": "Number of legs on a spider", "ar": "عدد أرجل العنكبوت"},
        "answer": "8",
        "hint": {"en": "Double of 4", "ar": "ضعف الـ 4"}
      },
      {
        "instruction": {"en": "Sports", "ar": "رياضة"},
        "clue": {"en": "Players in a football team", "ar": "لاعبين فريق كرة القدم (في الملعب)"},
        "answer": "11",
        "hint": {"en": "Includes the goalkeeper", "ar": "بما فيهم الحارس"}
      }
    ]
  };

  try {
    await firestore.collection('games').doc('the_vault').set(vaultGameData);
    print("✅ تم رفع بنك الأسئلة المطور بنجاح!");
  } catch (e) {
    print("❌ حصل مشكلة أثناء الرفع: $e");
  }
}