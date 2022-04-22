// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RestaurantDao? _restaurantDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Restaurant` (`name` TEXT NOT NULL, `imagesPath` TEXT NOT NULL, `imagesPath1` TEXT NOT NULL, `imagesPath2` TEXT NOT NULL, `imagesPath3` TEXT NOT NULL, `logoPath` TEXT NOT NULL, `deliveryTime` INTEGER NOT NULL, `offer` TEXT, `online` INTEGER NOT NULL, `tags` TEXT NOT NULL, `rating` REAL NOT NULL, `offerOn` INTEGER NOT NULL, PRIMARY KEY (`name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RestaurantDao get restaurantDao {
    return _restaurantDaoInstance ??= _$RestaurantDao(database, changeListener);
  }
}

class _$RestaurantDao extends RestaurantDao {
  _$RestaurantDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _restaurantInsertionAdapter = InsertionAdapter(
            database,
            'Restaurant',
            (Restaurant item) => <String, Object?>{
                  'name': item.name,
                  'imagesPath': item.imagesPath,
                  'imagesPath1': item.imagesPath1,
                  'imagesPath2': item.imagesPath2,
                  'imagesPath3': item.imagesPath3,
                  'logoPath': item.logoPath,
                  'deliveryTime': item.deliveryTime,
                  'offer': item.offer,
                  'online': item.online ? 1 : 0,
                  'tags': item.tags,
                  'rating': item.rating,
                  'offerOn': item.offerOn ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Restaurant> _restaurantInsertionAdapter;

  @override
  Future<List<Restaurant>> findAllRestaurants() async {
    return _queryAdapter.queryList('SELECT * FROM Restaurant',
        mapper: (Map<String, Object?> row) => Restaurant(
            row['name'] as String,
            row['logoPath'] as String,
            row['deliveryTime'] as int,
            row['offer'] as String?,
            (row['online'] as int) != 0,
            row['imagesPath'] as String,
            row['imagesPath1'] as String,
            row['imagesPath2'] as String,
            row['imagesPath3'] as String,
            row['tags'] as String,
            row['rating'] as double,
            (row['offerOn'] as int) != 0));
  }

  @override
  Future<List<Restaurant>> findOffers() async {
    return _queryAdapter.queryList('SELECT * FROM Restaurant Where offerOn =1',
        mapper: (Map<String, Object?> row) => Restaurant(
            row['name'] as String,
            row['logoPath'] as String,
            row['deliveryTime'] as int,
            row['offer'] as String?,
            (row['online'] as int) != 0,
            row['imagesPath'] as String,
            row['imagesPath1'] as String,
            row['imagesPath2'] as String,
            row['imagesPath3'] as String,
            row['tags'] as String,
            row['rating'] as double,
            (row['offerOn'] as int) != 0));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Restaurant');
  }

  @override
  Future<void> insertDevice(Restaurant restaurant) async {
    await _restaurantInsertionAdapter.insert(
        restaurant, OnConflictStrategy.abort);
  }
}
