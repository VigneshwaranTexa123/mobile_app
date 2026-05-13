import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'live_doff.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE live_doff_details (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          machine_no INTEGER UNIQUE,
          datas TEXT,
          machine_status TEXT DEFAULT 'STOPPED',
          status INTEGER DEFAULT 1,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
        ''');

        await db.insert(
          'live_doff_details',
          {
            'machine_no': 13,
            'datas':
            '{"good":8,"empty":0,"defect":0,"inspect":8,"full_cops":8,"half_cops":0,"doff_number":28,"quarter_cops":0}',
            'machine_status': 'STOPPED',
            'status': 1,
          },
        );
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await database;

    return await db.query('live_doff_details');
  }
}