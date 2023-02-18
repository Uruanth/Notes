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

## si esta dentro del arreglo
## Busca los documentos que incluyan el atributo like con un valor de true
## dentro del atributo padre
...find({
	atributo: {
		$elemMatch: {
			like: true
		}
	}
});

## Se puede combinar con otras cosas
...find({
	atributo: {
		$elemMatch: {
			$and: [
				## condiciones
			]
		}
	}
});
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
db.nombreColeccion.insertMany([{
	##Objeto a insertar
},
{
	##Objeto a insertar
}])

## Insertar un documento
## Si el documento no existe lo crea
## Si existe, lo actualiza, ambos casos en base al "_id"
db.nombreColeccion.save({
	##Objeto a insertar
})


## Actualizar documentos
## por default solo permite actualizar de a un documento 
db.nombreColeccion.update({
	## Condiciones del objeto 
},
{
	$set: { ## atributos que se van a actualizar
		atributo: 'nuevo valor'
	}
})

db.nombreColeccion.update({
	## Condiciones del objeto 
},
{
	$unset: { ## quitar atributo
		atributo: true
	}
})

## Añadir elementos a un ar 
db.nombreColeccion.update({
	## Condiciones del objeto 
},
{
	$push: { ## quitar atributo
		atributo: 'nuevo valor'
	}
})

db.nombreColeccion.updateOne({
	## Condiciones del objeto 
},
{
	## Cambios
})

## Actualizar varios
db.nombreColeccion.update({
	## Condiciones del objeto 
},
{
	## Cambios
},
{
	multi: true
})

db.nombreColeccion.updateMany({
	## Condiciones del objeto 
},
{
	## Cambios
})

## Incrementar un valor de atributo en el valor dado
db.nombreColeccion.updateMany({
	## Condiciones del objeto 
},
{
	$inc: {
		atributo: 1
	}
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
    email: /.com$/
})

## Saltar los primeros resultados
db.collectionName.find().skip(3);

## Ver los resultados mejor en conosla
db.collectionName.find().pretty():
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

## Proyecciones

Para obtener solo atributos seleccionados

~~~bash
db.collectionName.find({
	## Condiciones de la busqueda
},
{
	atributo: true, ## true o false dependiendo si se desea el atributo en el retorno
	atributo2: false ## Este atributo no se muestra
})
~~~

## Remove

~~~bash
## Eliminar datos de la coleccion
db.collectionName.remove({
	## Condiciones que si cumple se elimina el documento
});

## Eliminar coleccion
db.collectionName.drop();

## Eliminar database
db.dropDatabase();
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



