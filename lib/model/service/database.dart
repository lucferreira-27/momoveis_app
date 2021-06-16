import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  static resgatarCollection(collection) {
    return FirebaseFirestore.instance.collection(collection);
  }

  static atualizarDocumento(collection, id, data) {
    FirebaseFirestore.instance.collection(collection).doc(id).update(data);
  }

  static atualizarDocumentoComReferencia(
      CollectionReference collection, id, data) {
    collection.doc(id).update(data);
  }

  static deletarDocumentoComReferencia(
      CollectionReference collection, id) {
    collection.doc(id).delete();
  }

  static escreverDocumentoComReferencia(
      CollectionReference collection, data) {
    collection.add(data);
  }

  static deletarDocumento(collection, id) {
    FirebaseFirestore.instance.collection(collection).doc(id).delete();
  }

  static escreverDocumento(collection, data) {
    FirebaseFirestore.instance.collection(collection).add(data);
  }
}
