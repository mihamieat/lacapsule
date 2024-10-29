# MongoDB course commands
## Link for install
https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-debian/

## Insert data
db.students.insertOne({name: Alice, age: 19})

## dump mogo data
```
mongodump --db mydb --out -
```

## export to json
```
mongoexport -d <database> -c <colleciton>
 mongoexport -u developer -d mydb -c students -o mongodump.json
```

## update collection
```
https://www.mongodb.com/docs/manual/crud/
```

## Shell command to output json
```
mongosh -u developer company --eval 'db.employees.find({age: {$gte: 30}})'  > output.json
```
