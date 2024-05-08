import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb{
  


static  Database? _db; // variable  private 

// eza n3amal initial ma bade heye ten3amal marra tanye {bs marra we7de}
  Future<Database?> get db async {
    if (_db == null) { // ma n3amala initial
      _db = await initialDB();
    return _db;

    } else{ // eza n3ammala initial =>kel she tmm
           return _db;
    }
   
   
  }
Future<Database?> initialDB() async {
  try {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'jars.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  } catch (e) {
    print('Error initializing database: $e');
    return null;
  }
}



  // initialDB() async{

  //   String databasePath = await getDatabasesPath(); // e5teyar lmasar
  //   String path = join(databasePath, 'jar.db'); //'databasePath/eccomerce_app.db' =>rabot esm l db ma3 l path
  //   Database mydb = await openDatabase(path, onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade); // b2anshe2 l db;
  //   // version: eza bade zeed table msh b7aje kel sa3a em7e l db , bs b3adel 3al version
  //   // wb7ot lonUpgrade
  //   return mydb;
  // }



// eza bade zeed column men hon(_onCreate) bade em7e ldb(myDeleteDataBase) wberja3 bcreata 
//** ORRR */
// bsta3mel (_onUpgrade) 1- b8ayer ra2om l version / 2- b3mel alter lal table

  _onCreate(Database db, int version) async
  {
    Batch batch = db.batch();
    //  await db.execute('''  // => to insert one table / Batch => to insert many tables
  
   batch.execute('''  
      CREATE TABLE "days" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "name" TEXT NOT NULL,
        "image" TEXT NOT NULL
      )
     ''');


        batch.execute('''  
      CREATE TABLE "drivers" (
        "id" INTEGER ,
        "name" TEXT ,
        "phone" TEXT,
        "password" TEXT ,
        "totalJars" TEXT BY DEFAULT "0",
       


        "created_at" TEXT,
        "updated_at" TEXT
      )
     ''');

                          // الأدمن
            batch.execute('''  
      CREATE TABLE "users" ( 
        "id" INTEGER ,
        "email" TEXT ,
         "phone" TEXT NOT NULL UNIQUE,
         "password" TEXT NOT NULL,
         "status" INTEGER BY DEFAULT "0" NOT NULL 
        
      )
     ''');


           //  إسم البلده
           batch.execute('''  
      CREATE TABLE "towns" ( 
        "id" INTEGER ,
        "name" TEXT ,
      
        "created_at" TEXT,
        "updated_at" TEXT
        
      )
     ''');

                     // إسم الحي
          batch.execute('''  
        CREATE TABLE "districts" (
      "id" INTEGER,
      "name" TEXT,
      "town_id" INTEGER,
      "town_name_ar" TEXT,
      "town_name_en" TEXT,
      "created_at" TEXT,
      "updated_at" TEXT


      "FOREIGN KEY (town_id) REFERENCES towns (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"

       ) 
     ''');




                // إسم الزبون
          batch.execute('''  
      CREATE TABLE "customers" (
        "id" INTEGER ,
        "name" TEXT ,
        "phone" TEXT ,

        "town_id" INTEGER ,
        "town_name_ar" TEXT,
        "town_name_en" TEXT,

        "district_id" INTEGER ,
        "district_name_ar" TEXT,
        "district_name_en" TEXT,

        "driver_id" INTEGER ,
        "driver_name_ar" TEXT,
        "driver_name_en" TEXT,

        "created_at" TEXT,
        "updated_at" TEXT


        "FOREIGN KEY (town_id) REFERENCES towns (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (district_id) REFERENCES districts (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (driver_id) REFERENCES drivers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"


      )
     ''');


       //  إسم البلده
           batch.execute('''  
      CREATE TABLE "serepta" ( 
        "id" INTEGER ,
        "name" TEXT ,
        "price_Lira" Text,
        "price_Dollar" Text,

        "created_at" TEXT,
        "updated_at" TEXT
      )
     ''');



                     // إسم الزبون
          batch.execute('''  
      CREATE TABLE "customers_orders" (
        "id" INTEGER ,
        
        "driver_id" INTEGER ,
        "driver_name_ar" TEXT ,
        "driver_name_en" TEXT ,
        "totalJars" TEXT ,

        "customer_id" INTEGER ,
        "customer_name_ar" TEXT ,
        "customer_name_en" TEXT ,

        "town_id" INTEGER ,
        "town_name_ar" TEXT ,
        "town_name_en" TEXT ,

        "district_id" INTEGER ,
        "district_name_ar" TEXT ,
        "district_name_en" TEXT ,

        "serepta_id" INTEGER ,
        "serepta_name_ar" TEXT,
        "serepta_name_en" TEXT,
        "srpta_price_Lira" TEXT,
        "srpta_price_Dollar" TEXT,

        "created_at" TEXT,
        "updated_at" TEXT

        "FOREIGN KEY (driver_id) REFERENCES drivers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (town_id) REFERENCES towns (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (district_id) REFERENCES districts (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
        "FOREIGN KEY (serepta_id) REFERENCES serepta (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"


      )
     ''');






                 // الفاتوره
          batch.execute('''  
      CREATE TABLE "orders" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,

        "driver_id" INTEGER ,
         "driver_name" TEXT,
         "totalJars" TEXT ,
         
        "customer_id" INTEGER ,
        "customer_name" TEXT,
        
        "town_id" INTEGER ,
         "town_name" TEXT,
       
        "district_id" INTEGER ,
         "district_name" TEXT,
         
        "serepta_id" INTEGER ,
        "serepta_name" TEXT,
      
        "srpta_price_Lira" TEXT,
        "srpta_price_Dollar" TEXT,
      

        "qty_jar_in" INTEGER DEFAULT 0,
        "qty_jar_out" INTEGER DEFAULT 0,
        "qty_previous_jars" INTEGER  DEFAULT 0,
        "total_jar" INTEGER DEFAULT 0,


        "price_per_jar" FLOAT DEFAULT 0.0,
        "total_price_jars" FLOAT DEFAULT 0.0,
       

        "old_debt" FLOAT DEFAULT 0.0,
        "new_debt" FLOAT DEFAULT 0.0,

        "paid" FLOAT DEFAULT 0.0,
        "total_price" FLOAT DEFAULT 0.0,

        created_at TEXT,
        "updated_at" TEXT,




         "FOREIGN KEY (driver_id) REFERENCES drivers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (town_id) REFERENCES towns (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (district_id) REFERENCES districts (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (serepta_id) REFERENCES serepta (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"

        
      )
     ''');

    //    batch.execute('''
    //                UPDATE orders set jar_id=0 WHERE jar_id IS NULL;

    //  ''');

//"status"  TEXT , =>0 for bottels / 1 for jars
// debt => ديون
// paid => أدي فع
// total price => المجموع
  

     await batch.commit();
     print("=========================== _onCreate");
  }



// eza bade zeed table 3a db / 3adl she ...
_onUpgrade(Database db, int oldVersion, int newVersion)async {


     print("=========================== _onUpgrade");



    //             //  إسم البلده
    //        await db.execute('''  
    //   CREATE TABLE "admin" ( 
    //     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
    //     "name" TEXT NOT NULL UNIQUE,
    //      "phone" TEXT NOT NULL UNIQUE,
    //      "password" TEXT NOT NULL
        
    //   )
    //  ''');
           await db.execute('''
                   UPDATE orders set jar_id=0 WHERE jar_id IS NULL;

     ''');

      // await db.execute(
      //           "ALTER TABLE bottels ADD COLUMN status TEXT");


    //        // أنواع جرار المياه
    //       await  db.execute('''  
    //   CREATE TABLE "bottels" (
    //     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
    //     "name" TEXT NOT NULL UNIQUE,
    //     "company_id" INTEGER NOT NULL,
    //     "price" FLOAT BY DEFAULT "0" NOT NULL,

    //      "FOREIGN KEY (company_id) REFERENCES company (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
    //   )
    //  ''');


//      await db.execute('''
//   CREATE UNIQUE INDEX "unique_phone" ON "drivers" ("phone")
// ''');



            // الفاتوره
          await  db.execute('''  
      CREATE TABLE "orders" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
        "day_id" INTEGER NOT NULL,
        "driver_id" INTEGER NOT NULL,
        "customer_id" INTEGER NOT NULL,
        "town_id" INTEGER NOT NULL,
        "district_id" INTEGER NOT NULL,
        "company_id" INTEGER NOT NULL,
        "bottle_id" INTEGER NOT NULL,
        "qty_of_bottles" INTEGER BY DEFAULT "0" NOT NULL,
        "price" FLOAT BY DEFAULT "0" NOT NULL,
        "qty_jar_in" INTEGER BY DEFAULT "0" NOT NULL,
        "qty_jar_out" INTEGER BY DEFAULT "0" NOT NULL,
        "total_jar" INTEGER BY DEFAULT "0" NOT NULL,
        "total_price" FLOAT BY DEFAULT "0" NOT NULL,





         "FOREIGN KEY (day_id) REFERENCES days (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (driver_id) REFERENCES drivers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (town_id) REFERENCES towns (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (district_id) REFERENCES district (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (company_id) REFERENCES company (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
         "FOREIGN KEY (bottle_id) REFERENCES bottels (id) ON DELETE NO ACTION ON UPDATE NO ACTION,"
      )
     ''');
}






/***////////////////////////////////raed insert update delete///////////////////////////////////////// */
  readData(String sql)async {
    Database? mydb = await db; // bet7a2a2 eza kan 3aml initial or no
  
    List<Map> response = await mydb!.rawQuery(sql); // 3ashan rawQuery heye men noo3 (Future) bzeed awit
    return response;
  }




  
  insertData(String sql)async {
    Database? mydb = await db; // bet7a2a2 eza kan 3aml initial or no
  
  
    int response = await mydb!.rawInsert(sql); // 3ashan rawInsert heye men noo3 (Future) bzeed awit
    return response;
  }


//true without spatie
// syncData(String table, List<dynamic> dataList,  ConflictAlgorithm? conflictAlgorithm,) async {
//   Database? mydb = await db; // Check if initialized

//   int response = 0;
//   for (var data in dataList) {
//     // Assuming data is a Map<String, dynamic>
//     response = await mydb!.insert(table, data);
//   }

//   return response;
// }





// syncData(String table, List<dynamic> dataList,  ConflictAlgorithm? conflictAlgorithm) async {
//   Database? mydb = await db; // Check if initialized

//   int response = 0;
//   for (var data in dataList) {
//     // Assuming data is a Map<String, dynamic>
//     // Convert the 'name' field to JSON string before storing
//     if (data['name'] is Map<String, String>) {
//       data['name'] = jsonEncode(data['name']);
//     }
//     response = await mydb!.insert(table, data);
//   }

//   return response;
// }


// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   // Iterate over the results and decode the 'name' field
//   List<Map<String, dynamic>> decodedResults = results.map((data) {
//     if (data['name'] != null && data['name'] is String) {
//       data['name'] = jsonDecode(data['name'].toString());
//     }
//     return data;
//   }).toList();

//   return decodedResults;
// }



// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   return await mydb!.query(table);
// }







//////////////yyyyyyyyyyyyyyyyyeeeeeeeeeeeeeeeeessssssssssssssssss
// syncData(String table, List<dynamic> dataList, ConflictAlgorithm? conflictAlgorithm) async {
//   Database? mydb = await db; // Check if initialized

//   int response = 0;
//   for (var data in dataList) {
//     // Assuming data is a Map<String, dynamic>
//     // Convert the 'name' field to a string representation
//     if (data['name'] is Map<String, String>) {
//       // Combine 'ar' and 'en' values into a single string
//       String nameString = "${data['name']['ar']}, ${data['name']['en']}";
//       data['name'] = nameString;
//     }
//     response = await mydb!.insert(table, data);
//   }

//   return response;
// }



// Future<int> syncData(String table, List<Map<String, dynamic>> dataList, ConflictAlgorithm? conflictAlgorithm) async {
//   Database? mydb = await db;

//   int insertedRowCount = 0;

//   // Iterate over each data entry in the dataList
//   for (var data in dataList) {
//     // Check if the row already exists in the database
//     List<Map<String, dynamic>> existingRows = await mydb!.query(
//       table,
//       where: 'id = ?', // Assuming 'id' is the primary key
//       whereArgs: [data['id']], // Assuming 'id' exists in the data entry
//     );

//     if (existingRows.isEmpty) {
//       // Row does not exist, insert it into the database
      
//       // Handle 'name' field if it's a Map<String, String>
//       if (data['name'] is Map<String, String>) {
//         // Extract the 'en' and 'ar' values
//         String? nameEn = data['name']?['en'];
//         String? nameAr = data['name']?['ar'];
        
//         // Combine 'ar' and 'en' values into a single string
//         String nameString = "$nameAr, $nameEn";

//         // Update the 'name' field with the combined string
//         data['name'] = nameString;
//       }

//       // Insert the new data into the database
//       await mydb.insert(table, data, conflictAlgorithm: conflictAlgorithm);
//       insertedRowCount++;
//     }
//   }

//   return insertedRowCount;
// }








// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   // Iterate over the results and split the 'name' field if it's a string
//   List<Map<String, dynamic>> decodedResults = results.map((data) {
//     if (data['name'] is String) {
//       List<String> nameParts = data['name'].split(', ');
//       // Create a new Map instance with the desired modifications
//       Map<String, dynamic> modifiedData = Map.from(data); // Make a copy of data
//       modifiedData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
//       return modifiedData;
//     }
//     return data;
//   }).toList();

//   return decodedResults;
// }




// success with ar{        en}

// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   // Iterate over the results and split the 'name' field if it's a string
//   List<Map<String, dynamic>> decodedResults = results.map((data) {
//     if (data['name'] is String) {
//       List<String> nameParts = (data['name'] as String).split(',').map((part) => part.split('=').last as String).toList();
//       // Create a new Map instance with the desired modifications
//       Map<String, dynamic> modifiedData = Map.from(data); // Make a copy of data
//       modifiedData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
//       return modifiedData;
//     }
//     return data;
//   }).toList();

//   return decodedResults;
// }



// success with error in en : sarafand}
// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   // Iterate over the results and split the 'name' field if it's a string
//   List<Map<String, dynamic>> decodedResults = results.map((data) {
//     if (data['name'] is String) {
//       List<String> nameParts = (data['name'] as String).split(',').map((part) => part.split('=').last.trim()).toList();
//       // Create a new Map instance with the desired modifications
//       Map<String, dynamic> modifiedData = Map.from(data); // Make a copy of data
//       modifiedData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
//       return modifiedData;
//     }
//     return data;
//   }).toList();

//   return decodedResults;
// }

// success with error in en : sarafand}

// Future<List<Map<String, dynamic>>> getAllData(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   // Iterate over the results and split the 'name' field if it's a string
//   List<Map<String, dynamic>> decodedResults = results.map((data) {
//     if (data['name'] is String) {
//       List<String> nameParts = (data['name'] as String).split(',').map((part) {
//         List<String> keyValue = part.split('=');
//         if (keyValue.length == 2) {
//           return keyValue[1].trim();
//         } else {
//           print('Invalid name format: $part');
//           return '';
//         }
//       }).toList();
      
//       print('Name parts: $nameParts');

//       // Create a new Map instance with the desired modifications
//       Map<String, dynamic> modifiedData = Map.from(data); // Make a copy of data
//       modifiedData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
//       return modifiedData;
//     }
//     return data;
//   }).toList();

//   return decodedResults;
// }

//************************************************************************** */
Future<int> syncData(String table, List<Map<String, dynamic>> dataList, ConflictAlgorithm? conflictAlgorithm) async {
  Database? mydb = await db;

  int insertedRowCount = 0;

  // Iterate over each data entry in the dataList
  for (var data in dataList) {
    // Check if the row already exists in the database
    List<Map<String, dynamic>> existingRows = await mydb!.query(
      table,
      where: 'id = ?', // Assuming 'id' is the primary key
      whereArgs: [data['id']], // Assuming 'id' exists in the data entry
    );

    if (existingRows.isNotEmpty) {
      // Row exists, update it in the database
      
      // Handle 'name' field if it's a Map<String, String>
      if (data['name'] is Map<String, String>) {
        // Extract the 'en' and 'ar' values
        String? nameEn = data['name']?['en'];
        String? nameAr = data['name']?['ar'];
        
        // Combine 'ar' and 'en' values into a single string
        String nameString = "$nameAr, $nameEn";

        // Update the 'name' field with the combined string
        data['name'] = nameString;
      }

      // Update the existing data in the database
      await mydb.update(
        table,
        data,
        where: 'id = ?', // Assuming 'id' is the primary key
        whereArgs: [data['id']], // Assuming 'id' exists in the data entry
      );
    } else {
      // Row does not exist, insert it into the database
      await mydb.insert(table, data, conflictAlgorithm: conflictAlgorithm);
      insertedRowCount++;
    }
  }

  return insertedRowCount;
}
//******************************************************************************************** */


// Future<int> syncData(String table, List<Map<String, dynamic>> dataList, ConflictAlgorithm? conflictAlgorithm, {Map<String, String>? relationshipFields}) async {
//   Database? mydb = await db;
//   int insertedRowCount = 0;

//   for (var data in dataList) {
//     List<Map<String, dynamic>> existingRows = await mydb!.query(
//       table,
//       where: 'id = ?',
//       whereArgs: [data['id']],
//     );

//     if (existingRows.isEmpty) {
//       if (relationshipFields != null) {
//         // Handle relationship fields
//         for (var entry in relationshipFields.entries) {
//           String relationshipField = entry.key;
//           String relatedTable = entry.value;

//           if (data[relationshipField] is Map<String, dynamic>) {
//             Map<String, dynamic> relatedData = data[relationshipField];
//             int relatedInsertCount = await syncData(relatedTable, [relatedData], conflictAlgorithm);
//             if (relatedInsertCount > 0) {
//               data['${relationshipField}_id'] = relatedData['id'];
//             }
//           }
//         }
//       }

//       await mydb.insert(table, data, conflictAlgorithm: conflictAlgorithm);
//       insertedRowCount++;
//     }
//   }

//   return insertedRowCount;
// }



// Future<List<Map<String, dynamic>>> getAllDataWithRelations(String table) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.query(table);

//   List<Map<String, dynamic>> mutableResults = [];

//   // Iterate over the results and fetch related town data
//   for (var data in results) {
//     // Parse the 'name' field from string to Map<String, String>
//     if (data['name'] is String) {
//       List<String> nameParts = (data['name'] as String).split(',').map((part) {
//         return part.trim(); // Trim each part to remove leading and trailing whitespace
//       }).toList();

//       // Check if the name field has expected parts
//             // Create a new map with the modified 'name' field
// Map<String, dynamic> newData = Map.from(data);
// if (nameParts.length == 2) {
//   newData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
// } else {
//   print('Invalid name parts: $nameParts');
//   // Handle the error gracefully, you can choose to skip this data or handle it according to your requirement
//   continue;
// }
//     }

//     if (data['town_id'] != null) {
//       // Fetch town data based on town_id
//       List<Map<String, dynamic>> townResult = await mydb.query(
//         'towns',
//         where: 'id = ?',
//         whereArgs: [data['town_id']],
//       );

//       // If town data exists, create a new map and combine both district and town data
//       if (townResult.isNotEmpty) {
//         Map<String, dynamic> townData = Map.from(townResult.first);
//         Map<String, dynamic> newData = Map.from(data);
//         newData['townsRltn'] = townData;
//         mutableResults.add(newData);
//       }
//     } else {
//       // If town_id is null, simply add the district data to mutableResults
//       mutableResults.add(data);
//     }
//   }

//   return mutableResults;
// }






Future<List<Map<String, dynamic>>> getAllData(String table) async {
  Database? mydb = await db;
  List<Map<String, dynamic>> results = await mydb!.query(table);

  // Iterate over the results and split the 'name' field if it's a string
  List<Map<String, dynamic>> decodedResults = results.map((data) {
    if (data['name'] is String) {
      print('Original name: ${data['name']}'); // Debug output for original 'name' field
      List<String> nameParts = (data['name'] as String).split(',').map((part) {
        return part.trim(); // Trim each part to remove leading and trailing whitespace
      }).toList();
      
      print('Name parts: $nameParts');

      // Create a new Map instance with the desired modifications
      Map<String, dynamic> modifiedData = Map.from(data); // Make a copy of data
      if (nameParts.length == 2) {
        modifiedData['name'] = {'ar': nameParts[0], 'en': nameParts[1]};
      } else {
        print('Invalid name parts: $nameParts');
      }
      return modifiedData;
    }
    return data;
  }).toList();

  return decodedResults;
}



// Future<List<Map<String, dynamic>>> getAllData(String query) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> results = await mydb!.rawQuery(query);
//   return results;
// }


// Future<bool> checkIfDataExists(String table, int? id) async {
//   Database? mydb = await db;
//   List<Map<String, dynamic>> result = await mydb!.query(
//     table,
//     where: 'id = ?',
//     whereArgs: [id],
//   );
//   return result.isNotEmpty;
// }



// Future<List<Map>> syncDataFromOnLineToOffLine(List<dynamic> data, String tableName) async {
//   Database? mydb = await db;
//   List<Map> insertedData = [];

//   for (var item in data) {
//     final jsonData = item.toJson();
//     int id = await mydb!.insert(tableName, jsonData, conflictAlgorithm: ConflictAlgorithm.replace);
//     // Assuming you have an auto-incrementing primary key 'id'
//     if (id != null && id > 0) {
//       // If insertion is successful, add the inserted row to the list
//       jsonData['id'] = id; // Update the JSON data with the newly generated ID
//       insertedData.add(jsonData);
//     }
//   }

//   return insertedData;
// }

    updateData(String sql)async {
    Database? mydb = await db; // bet7a2a2 eza kan 3aml initial or no
  
    int response = await mydb!.rawUpdate(sql); // 3ashan rawInsert heye men noo3 (Future) bzeed awit
    return response;
  }


    deleteData(String sql)async {
    Database? mydb = await db; // bet7a2a2 eza kan 3aml initial or no
  
    int response = await mydb!.rawDelete(sql); // 3ashan rawInsert heye men noo3 (Future) bzeed awit
    return response;
  }

// eza bade em7e ldb 

myDeleteDataBase() async {

  String databasePath = await getDatabasesPath(); // e5teyar lmasar
  String path = join(databasePath, 'jar.db'); //'databasePath/eccomerce_app.db' =>rabot esm l db ma3 l path
  await deleteDatabase(path);
}







  // Select
  // Insert  => return int => ra2om l row le zado {1,2, ...} / Or {0} if failed
  // Update  => return int => ra2om l row le update {1,2, ...} / Or {0} if failed
  // Delete  => return int => ra2om l row le delete {1,2, ...} / Or {0} if failed

}