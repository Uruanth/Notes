# Mongo



## Varios

~~~bash
## Mostras BD's
show databases;

## Mostrar colecciones
show collections;

## Contar los resultados 
db.collectionName.find({
	"atributo": "valor" 
})
.count();
~~~

## Insert

~~~bash

## Insertar un documento
db.nombreColeccion.insert({
	##Objeto a insertar
})
db.nombreColeccion.insertOne({
	##Objeto a insertar
})

## Insertar varios documentos
db.nombreColeccion.insertMany({
	##Objeto a insertar
},
{
	##Objeto a insertar
})

## Insertar un documento
## Si el documento no existe lo crea
## Si existe, lo actualiza, ambos casos en base al "_id"
db.nombreColeccion.save({
	##Objeto a insertar
})
~~~

## Find

~~~bash
# Buscar varios
db.collectionName.find({
	"atributo": "valor" ## Si se cumple la condicion lo muestra en el resultado
})

## Buscar solo uno
db.collectionName.findOne({
	"atributo": "valor" ## Si se cumple la condicion lo muestra en el resultado
})

## Buscar todos los que sean mayor que 10
## gt es 'great that'
db.collectionName.find({
	"atributo": { $gt: 10 }
})

## Condicional Y
## Todas las condiciones dentro de la lista del operador se deben cumplir
db.collectionName.find({
	$and: [
		atributo: {$lt: 43},
		...
	]
})

## Esta dentro de
db.collectionName.find({
    atributo: {$in: [1,2..., valorFinal]},
})

## Si el atributo existe
db.collectionName.find({
    atributo: { $exists: true }
})

## Se pueden usar expresiones regulares para buscar
## Ejemplo los correos terminados en .com
db.collectionName.find({
    email: /.com
})
~~~

## Sort

~~~bash
## Limitar los resultados
db.collectionName.find({
    atributo: { $exists: true }
})
.limit(1);

## Ordenar de manera asc es 1 y desc es -1
db.collectionName.find({
    atributo: { $exists: true }
})
.sort(1);

## Ordenar en base a un atributo
db.collectionName.find()
.sort({
    atributo: -1
});
~~~



## Operadores

| Operador          | shortcut | how use                                                |
| ----------------- | -------- | ------------------------------------------------------ |
| Mayor que         | $gt      | db.collectionName.find({	"atributo": { $gt: 10 }})  |
| Mayor o igual que | $gte     | db.collectionName.find({	"atributo": { $gte: 10 }}) |
| Menor que         | $lt      | db.collectionName.find({	"atributo": { $lt: 10 }})  |
| Menor o igual que | $lte     | db.collectionName.find({	"atributo": { $lte: 10 }}) |

## Condicionales

| Nombre                                | shortcut | how use                                                      |
| :------------------------------------ | :------- | :----------------------------------------------------------- |
| Y                                     | $and     | ...find({<br/>	$and: [<br/>		atributo: {$lt: 43},<br/>		...<br/>	]<br/>}) |
| O                                     | $or      | ...find({<br/>	$or: [<br/>		atributo: {$lt: 43},<br/>		...<br/>	]<br/>}) |
| Esta  dentro de                       | $in      | db.collectionName.find({<br/>    atributo: {$in: [1,2..., valorFinal]},<br/>}) |
| Si el atributo existe en el documento | $exists  | db.collectionName.find({<br/>    atributo: { $exists: true }<br/>}) |



