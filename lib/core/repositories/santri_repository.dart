import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/santri_model.dart';

class SantriRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = 'santri';

  Stream<List<SantriModel>> getSantriList() {
    return _db.collection(_collection).orderBy('nama').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => SantriModel.fromFirestore(doc)).toList();
    });
  }

  Future<void> addSantri(SantriModel santri) async {
    await _db.collection(_collection).add(santri.toFirestore());
  }

  Future<void> updateSantri(SantriModel santri) async {
    await _db.collection(_collection).doc(santri.id).update(santri.toFirestore());
  }

  Future<void> deleteSantri(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }
}
