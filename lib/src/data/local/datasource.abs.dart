import 'package:sqflite/sqlite_api.dart';

abstract class DataSource<T> {
  Future create();
  Future<T> insert(T item);
  Future<T?> getById(int id);
  Future<List<T>?> getByFilter(Map<String, dynamic> filters);
  Future<int> delete(int id);
  Future<int> update(T item);
  Future close();

}