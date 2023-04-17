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

## UriParam

\<Path>foo/{param1}/bar/{param2}

## Varios

### Valor atributo etiqueta XML

Para obtener el valor de un atributo en una etiqueta xml se antepone el @ para inidcar que es el atributo. Ej. payload.etiqieta.@atributo

### Variables de entorno

Para llamar una variable de entorno es mendiate `${ruta.propiedad}` y si se hace desde DataWeave `Mule::p('ruta.propiedad')`

## Errores

El objeto error tiene dos atributos importantes

* error.Description, descripciòn del error
* error.errorType. tipo de error

### OnErrorContinue

### OnErrorPropagate

## DataWeave

### Selectores

| Selector       | Use                                                          | How it works                                                 |
| -------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Single-value   | `.keyName`                                                   | Any type of value that belongs to a matching key             |
| Multi-value    | `.*keyName`                                                  | Array of values of any matching keys                         |
| Descendants    | `..keyName`                                                  | Array of values of any matching descendant keys              |
| Dynamic        | See [Dynamic Selector](https://docs.mulesoft.com/dataweave/2.4/dataweave-selectors#dynamic_selector). |                                                              |
| Key-value pair | `.&keyName`                                                  | Object with the matching key                                 |
| Index          | `[<index>]`                                                  | Value of any type at selected array index. Use negative numbers to index from the end of an array, for example, `-1` for the last element in the array. Use of numbers beyond the array size returns `null`. |
| Range          | `[<index> to <index>]`                                       | Array with values from selected indexes                      |
| XML attribute  | `@`, `.@keyName`                                             | String value of the selected attribute                       |
| Namespace      | `keyName.#`                                                  | String value of the namespace for the selected key           |
| Key present    | `keyName?`, `keyName.@type?`                                 | Boolean (`true` if the selected key of an object or XML attribute is present, `false` if not) |
| Assert present | `keyName!`                                                   | String: Exception message if the key is not present          |
| Filter         | `[?(boolean_expression)]`                                    | Array or object containing key-value pairs *if* the DataWeave expression returns `true`. Otherwise, returns the value `null`. |
| Metadata       | `.^someMetadata`                                             | Returns the value of specified metadata for a Mule payload, variable, or attribute. The selector can return the value of class (`.^class`), content length (`.^contentLength`), encoding (`.^encoding`), mime type (`.^mimeType`), media type (`.^mediaType`), raw (`.^raw`), and custom (`.^myCustomMetadata`) metadata. For details, see [Extract Data](https://docs.mulesoft.com/dataweave/2.4/dataweave-cookbook-extract-data#selector_metadata). |

### Date

para pasar un string del payload a un date se realiza de la siguiente manera:

~~~typescript
"1198/11/22" as Date {format : "yyyy/MM/dd"}
"22-11-1998" as Date {format : "dd-MM-yyyy"}
~~~

### Funciones

* now(), tiempo actual
* sizeOf(arg), tamaño del array del argumento
* isEmpty(arg), si el argumento esta vacio
* upper(string), mayusculas del argumento
* #["$(vars.variable)"], para hacer la variable dentro de un string
* fun nameFunction(args) = (logica), 

## MUnit

Framework de pruebas unitarias para Mulesoft

### Assert

* attributes
  * statusCode
  * headers
    * Se llama el header correspondiente entre **'header'**
  * uriParams
  * queryParams
* payload, el cuerpo de la petición/respuesta