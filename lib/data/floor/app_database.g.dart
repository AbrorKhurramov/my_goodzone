// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

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

  ProductDao? _productDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Products` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `price` INTEGER NOT NULL, `quantity` INTEGER NOT NULL, `image` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _productsInsertionAdapter = InsertionAdapter(
            database,
            'Products',
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                },
            changeListener),
        _productsUpdateAdapter = UpdateAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                },
            changeListener),
        _productsDeletionAdapter = DeletionAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'quantity': item.quantity,
                  'image': item.image
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Products> _productsInsertionAdapter;

  final UpdateAdapter<Products> _productsUpdateAdapter;

  final DeletionAdapter<Products> _productsDeletionAdapter;

  @override
  Stream<List<Products>> getBasketProducts() {
    return _queryAdapter.queryListStream('SELECT * FROM Products',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String,
            image: row['image'] as String,
            name: row['name'] as String,
            price: row['price'] as int,
            quantity: row['quantity'] as int),
        queryableName: 'Products',
        isView: false);
  }

  @override
  Future<List<Products>> getBasketProductsAsync() async {
    return _queryAdapter.queryList('SELECT * FROM Products',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String,
            image: row['image'] as String,
            name: row['name'] as String,
            price: row['price'] as int,
            quantity: row['quantity'] as int));
  }

  @override
  Future<void> insertProduct(Products product) async {
    await _productsInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(Products product) async {
    await _productsUpdateAdapter.update(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> removeProduct(Products product) async {
    await _productsDeletionAdapter.delete(product);
  }

  @override
  Future<void> removeAll(List<Products> products) async {
    await _productsDeletionAdapter.deleteList(products);
  }
}
