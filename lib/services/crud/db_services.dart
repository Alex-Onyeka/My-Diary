import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show
        MissingPlatformDirectoryException,
        getApplicationDocumentsDirectory;
import 'package:sqflite/sqflite.dart';

class DatabaseAlreadyOpenException implements Exception {}

class UnableToGetDocumentsDirectory implements Exception {}

class DatabaseIsNotOpen implements Exception {}

class NoteService {
  Database? _db;

  Future<void> closeDb() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    } else {
      try {
        final docsDir =
            await getApplicationDocumentsDirectory();

        final dbPath = join(docsDir.path, dbName);
        final db = await openDatabase(dbPath);
        _db = db;

        // Create User Table
        await db.execute(createUserTable);

        //
        // Create Notes Table
        await db.execute(createNoteTable);
        //
      } on MissingPlatformDirectoryException {
        throw UnableToGetDocumentsDirectory();
      }
    }
  }
}

class DbUser {
  final int id;
  final String name;
  final String email;

  DbUser.fromRow(Map<String, Object?> map)
    : id = map[idColumn] as int,
      name = map[nameColumn] as String,
      email = [emailColumn] as String;

  @override
  String toString() {
    return 'Person; ID: $id, NAME: $name, EMAIL: $email';
  }

  @override
  bool operator ==(covariant DbUser other) {
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DbNotes {
  final int id;
  final String title;
  final String text;
  final int userId;
  final bool isSynced;

  DbNotes.fromRow(Map<String, Object?> map)
    : id = map[idColumn] as int,
      title = map[titleColumn] as String,
      text = map[textColumn] as String,
      userId = map[userIdColumn] as int,
      isSynced =
          (map[isSyncedColumn] as int) == 1 ? true : false;

  @override
  String toString() {
    return 'Note; ID: $id, TItle: $title, UserId: $userId, ISSYNCED: $isSynced, TEXT: $text';
  }

  @override
  bool operator ==(covariant DbNotes other) {
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

//
//
//
//
// Constans

// Varialbles
const idColumn = 'id';
const nameColumn = 'name';
const emailColumn = 'email';
const titleColumn = 'title';
const textColumn = 'text';
const userIdColumn = 'user_id';
const isSyncedColumn = 'is_synced';

// Database Constants
const dbName = 'notes.db';
const noteTableName = 'notes';
const userTableName = 'users';
const createUserTable =
    ''' CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
); ''';
const createNoteTable =
    ''' CREATE TABLE IF NOT EXISTS "notes" (
	"id"	INTEGER NOT NULL UNIQUE,
	"title"	TEXT NOT NULL,
	"text"	TEXT,
	"user_id"	INTEGER NOT NULL,
	"is_synced"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "users"("id")
); ''';
