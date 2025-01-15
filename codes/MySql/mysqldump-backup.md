### **Git Stash**


#Exporting MySQL database from xampp

The command line :

First of all open command prompt
Syntax:-
Import Database :

```shell
- D:/xampp/mysql/bin/mysql – u root -p databasename < D:/test.sql (sql file name)
```

Export Database :
```shell
- D:/xampp/mysql/bin/mysqldump -u root -p databasename > D:/text.sql(sql file name)
```

mysqldump -h 10.10.10.10 -u usuario -p nombre_de_base_de_datos > respaldo.sql
1)
C:/xampp/mysql/bin/mysqldump -h 10.2.147.110 -u USR_NEQUIZ -p DB_CONEXP_WEB > C:/xampp/BackupDB/text.sql

2)
C:/xampp/mysql/bin/mysqldump.exe DB_CONEXP_WEB --routines --result-file=C:/Users/BEELINK-MINI/Downloads/Datagrip/Data_10_2_147_110-2024_11_07_16_26_49-dump.sql --disable-keys --complete-insert --no-create-info --no-data --user=USR_NEQUIZ --host=10.2.147.110 --port=3306



