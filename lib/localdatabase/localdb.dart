import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
late Database database;

CreateDatabase()async{
  var datapath =await getDatabasesPath();
  print(datapath);
  String path = join(datapath as String, "contact db");
  print(path);
  
  database =await openDatabase(path, version: 1,
  onCreate: (db ,version){
    db.execute('CREATE TABLE Contact (id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT)')
        .then((value){
          print('table create');
    }).catchError((error){
      print("error");
    });
  },
    onOpen: (db){
      getDataBase(db);
      print("DataBase opened");
    }
  );
}
insertDataBase({required String title ,required String subtitle})async{
  await database.transaction((txn){
    return txn.rawInsert('INSERT INTO Contact(title, subtitle) VALUES("$title", "$subtitle")')
        .then((value){
      print("$value record inserted");
      getDataBase(database);
    }).catchError((error){
      print(error);
    });
  });
}
UpdateDatabase({required int id,required String title ,required String subtitle})async{
  await database.transaction((txn){
    return txn.rawUpdate('UPDATE Contact SET title = ?, subtitle = ? WHERE id = ?',
        ['title', 'subtitle', 'id'])
        .then((value){
      print("$value updated");
      getDataBase(database);
    }).catchError((error){
      print(error);
    });
  });
}
deleteContact({required int id})async{
  await database.rawDelete('DELETE FROM Contact WHERE id = ?', [id]).then((value) {
    print("$value is deleted");
    getDataBase(database);
  }).catchError((error){
    print(error);
  });
}
List<Map>contactsList=[];
List<Map>favoriteList=[];

getDataBase(Database database){
  contactsList.clear();
  database.rawQuery('SELECT * FROM Contact').then((value) {
    for(Map<String,Object?> element in value){
      contactsList.add(element);
    }
  }).catchError((error) {
    print(error);
  });
}