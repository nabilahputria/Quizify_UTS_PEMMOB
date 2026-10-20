class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

// Data dummy pertanyaan kuis (bisa ditambah sesuai kebutuhan)
final List<Question> dummyQuestions = [
  Question(
    questionText: "Apa kepanjangan dari widget StatelessWidget di Flutter?",
    options: [
      "Widget yang tidak pernah dirender ulang",
      "Widget yang tidak memiliki state yang dapat berubah",
      "Widget statis untuk tampilan gambar",
      "Widget bawaan dari sistem Android",
    ],
    correctOptionIndex: 1,
  ),
  Question(
    questionText: "Bahasa pemrograman apa yang digunakan untuk mengembangkan aplikasi Flutter?",
    options: ["Java", "Python", "Dart", "C++"],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Fungsi utama dari StatefulWidget adalah...",
    options: [
      "Menyimpan data yang dapat berubah selama siklus hidup widget",
      "Mempercepat koneksi internet aplikasi",
      "Mengkompilasi kode ke dalam format APK",
      "Menggantikan fungsi database lokal",
    ],
    correctOptionIndex: 0,
  ),
  Question(
    questionText: "Di mana letak file konfigurasi utama untuk dependensi dan aset di Flutter?",
    options: [
      "main.dart",
      "android/build.gradle",
      "pubspec.yaml",
      "analysis_options.yaml",
    ],
    correctOptionIndex: 2,
  ),
  Question(
    questionText: "Manakah yang termasuk ke dalam komponen UI reusable widget?",
    options: [
      "Membuat widget kustom terpisah di folder widgets/",
      "Menulis semua kode UI di dalam main.dart",
      "Membuat file screen baru untuk setiap soal",
      "Menghapus fungsi build",
    ],
    correctOptionIndex: 0,
  ),
];