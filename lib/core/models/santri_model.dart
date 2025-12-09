import 'package:cloud_firestore/cloud_firestore.dart';

class SantriModel {
  final String id;
  final String nis;
  final String nama;
  final String kamar;
  final int angkatan;

  SantriModel({
    required this.id,
    required this.nis,
    required this.nama,
    required this.kamar,
    required this.angkatan,
  });

  factory SantriModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return SantriModel(
      id: doc.id,
      nis: data['nis'] ?? '',
      nama: data['nama'] ?? '',
      kamar: data['kamar'] ?? '',
      angkatan: data['angkatan'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nis': nis,
      'nama': nama,
      'kamar': kamar,
      'angkatan': angkatan,
    };
  }
}
