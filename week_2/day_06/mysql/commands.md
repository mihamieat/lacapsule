## connect with root
```
mysql -u root =p
```
## create user
```
create user 'user'@'localhost' identified by 'password';
```
## connect with user
```
mysql -u developer -p <database>
```

## create database
```
create databse my_database;
```

## Grand privileges
```
GRANT ALL PRIVILEGES ON 'mydb'.* TO 'developer'@'localhost';
GtRANT ALL PRIVILEGES ON mydb.* TO 'developer'@'localhost';
```

## Create database
```
create database mydb;
```

## Create tables (id is optional)
```
create table students( id serial primary key, firstname varchar(255) NOT NULL, age int UNSIGNED );
```

## dump database
```
mysqldump --help -u developer -p qwerty -h localhost mydb > mydb_dump.sql
```
## insert data into table
```
insert into <table> values ('value 1', 'value ') 
```
## Edit value
```
update employees
set age = 26
where name = Jane Smith;
```
## Detele
```
delete from <table> where <conditions>;
```
## Display ages above 30;
```
select * from employees where age >= 30;
```
## Dump database;
```
mysql -u root -p autodump < autodump.sql
```