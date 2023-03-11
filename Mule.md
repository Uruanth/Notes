# Mule

## Funciones

### map

~~~java
payload map ((item, index) -> {
	id: item.id,
	correo: item.correo default "",
	apellido: item.apellido default "",
	celular: item.celular default "",
	nombre: item.nombre default "",
	clave: item.clave default ""
})
~~~

### flatten(payload..payload)

Aplanar un arreglo

~~~java
flatten(payload..payload)
~~~

### CorrelationId

Es un objeto predefinido en Mule, que viene en la cabeceras del listener, si no viene en la petición lo crea automaticamente



## Errores

El objeto error tiene dos atributos importantes

* error.Description, descripciòn del error
* error.errorType. tipo de error

### OnErrorContinue

### OnErrorPropagate



## MUnit

Framework de pruebas unitarias para Mulesoft

### Assert

* attributes
  * statusCode
* payload, el cuerpo de la respuesta