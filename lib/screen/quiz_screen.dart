import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  List<int?> selectedAnswers = List.filled(dummyQuestions.length, null);

  @override
  Widget build(BuildContext context) {
    final question = dummyQuestions[currentIndex];
    final progress = (currentIndex + 1) / dummyQuestions.length;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Kuis - Halo, ${widget.userName}",
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Bar Dinamis
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                color: Colors.indigo,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 16),
              Text(
                "Pertanyaan ${currentIndex + 1} dari ${dummyQuestions.length}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),

              // Teks Pertanyaan
              Text(
                question.questionText,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Daftar Opsi Pilihan Ganda (ListView dengan Expanded agar responsif)
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return OptionCard(
                      text: question.options[index],
                      isSelected: selectedAnswers[currentIndex] == index,
                      onTap: () {
                        setState(() {
                          selectedAnswers[currentIndex] = index;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Navigasi Bawah (Sebelumnya / Selanjutnya / Selesai)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentIndex > 0)
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        setState(() {
                          currentIndex--;
                        });
                      },
                      child: const Text("Sebelumnya", style: TextStyle(fontFamily: 'Poppins')),
                    )
                  else
                    const SizedBox(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (selectedAnswers[currentIndex] == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Pilih salah satu jawaban terlebih dahulu!")),
                        );
                        return;
                      }

                      if (currentIndex < dummyQuestions.length - 1) {
                        setState(() {
                          currentIndex++;
                        });
                      } else {
                        // Hitung skor akhir
                        int score = 0;
                        for (int i = 0; i < dummyQuestions.length; i++) {
                          if (selectedAnswers[i] == dummyQuestions[i].correctOptionIndex) {
                            score += 20; // 5 soal x 20 = 100 poin maksimal
                          }
                        }

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              userName: widget.userName,
                              score: score,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      currentIndex == dummyQuestions.length - 1 ? "Selesai" : "Selanjutnya",
                      style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}