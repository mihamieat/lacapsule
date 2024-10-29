## Connect as root user
```
sudo -u postgres psql
```
## Create user
```
create user john with encrypted password '<password>';
```

## Create database
```
create database mydb;
```
## Grand user to database
```
grant all on database <my_database> to <user>;
alter database <my_database> owner to <user>;
```
## Connect as user
```
psql -U <user> -h 127.0.0.1 -d <my_database>
```
## Create tabel
```
create table <table_name>(
    id serial pirmary key,
    title varchar not null,
    content text not null,
    number int,
)
```
## Insert values
```
insert into <table> values ('value 1', 'value 2')
```

## Import dumps
```
psql --username=developer <database> < <databadse_ dump.sql> -h <host>
```