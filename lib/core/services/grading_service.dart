import '../models/penilaian_model.dart';

class GradingService {
  double calculateTahfidz(List<PenilaianTahfidz> list) {
    if (list.isEmpty) return 0;
    // Assuming we take the latest or average? PDF says "tahfidz = round(0.5*capaian + 0.5*tajwid)"
    // It implies per assessment or overall?
    // "Nilai Tahfidz (0–100): Komponen: ... Gabungan"
    // Usually Rapor is cumulative or average of the term.
    // Let's average the final scores of all entries for the period.
    double total = 0;
    for (var p in list) {
      total += p.nilaiAkhir;
    }
    return (total / list.length).roundToDouble();
  }

  double calculateMapel(List<PenilaianMapel> list, String mapelName) {
    final mapelList = list.where((m) => m.mapel == mapelName).toList();
    if (mapelList.isEmpty) return 0;
    double total = 0;
    for (var p in mapelList) {
      total += p.nilaiAkhir;
    }
    return (total / mapelList.length).roundToDouble();
  }

  double calculateAkhlak(List<PenilaianAkhlak> list) {
    if (list.isEmpty) return 0;
    double total = 0;
    for (var p in list) {
      total += p.nilaiAkhir;
    }
    return (total / list.length).roundToDouble();
  }

  double calculateKehadiran(List<Kehadiran> list) {
    if (list.isEmpty) return 100; // Default full attendance if no records? Or 0? Let's say 100 or 0 based on policy. Let's start with 0 if no data, but usually 100 if no absence recorded.
    // Actually, "hadir% = (H / (H+S+I+A)) * 100".
    // If list is empty, H=0, total=0. 0/0.
    if (list.isEmpty) return 0;

    int hadir = list.where((k) => k.status == 'H').length;
    int total = list.length;
    return ((hadir / total) * 100).roundToDouble();
  }

  Map<String, dynamic> calculateFinalGrade({
    required double tahfidz,
    required double fiqh,
    required double bahasaArab,
    required double akhlak,
    required double kehadiran,
  }) {
    // Bobot: Tahfidz 30%, Fiqh 20%, Bahasa Arab 20%, Akhlak 20%, Kehadiran 10%
    double finalScore = (0.30 * tahfidz) +
        (0.20 * fiqh) +
        (0.20 * bahasaArab) +
        (0.20 * akhlak) +
        (0.10 * kehadiran);
    
    finalScore = finalScore.roundToDouble();

    String predikat = 'D';
    if (finalScore >= 85) {
      predikat = 'A';
    } else if (finalScore >= 75) {
      predikat = 'B';
    } else if (finalScore >= 65) {
      predikat = 'C';
    }

    return {
      'score': finalScore,
      'predikat': predikat,
    };
  }
}
