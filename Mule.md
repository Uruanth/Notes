# Mule

## Funciones

### map

```java
payload map ((item, index) -> {
    id: item.id,
    correo: item.correo default "",
    apellido: item.apellido default "",
    celular: item.celular default "",
    nombre: item.nombre default "",
    clave: item.clave default ""
})
```

### flatten(payload..payload)

Aplanar los objetos internos de un arreglo

```java
var aa = [
    {
        atrinuto1: 123,
        atributo2: "addasd"
    },
    {
        atrinuto1: 123,
        atributo2: "addasd"
    },
    [
        {
            atrinuto1: 123,
            atributo2: "addasd"
        }
    ]
]


flatten(aa)

//El resultado seria 
 [
    {
        atrinuto1: 123,
        atributo2: "addasd"
    },
    {
        atrinuto1: 123,
        atributo2: "addasd"
    },
    {
        atrinuto1: 123,
        atributo2: "addasd"
    }   
]
```

### Pluck

pluck ( value, key, index ) , 

```java
var aa = {
        atrinuto1: 123,
        atributo2: "addasd"
    }

aa pluck $$$ //Obtener los index de los atributos del objeto
aa pluck $$ //Obtener los nombres de los atributos del objeto
aa pluck $ //Obtener los valores de los atributos del objeto
```



### CorrelationId

Es un objeto predefinido en Mule, que viene en la cabeceras del listener, si no viene en la petición lo crea automaticamente

## UriParam



\<Path>foo/{param1}/bar/{param2}

## Varios

### Valor atributo etiqueta XML

Para obtener el valor de un atributo en una etiqueta xml se antepone el @ para inidcar que es el atributo. Ej. payload.etiqieta.@atributo

### Variables de entorno

Para llamar una variable de entorno es mendiate `${ruta.propiedad}` y si se hace desde DataWeave `Mule::p('ruta.propiedad')`

## Secure properties

Donde Blowfish es el algoritmo, CBC es el modo y mulesoft es la llave  

```shell
java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool string encrypt Blowfish CBC mulesoft "some value to encrypt"
```

Para general la configuracion global, toca agregar el modulo de secure properties de Mule, y en el `yaml` se debe de colocar el atributo entre comillas y dentro de estas comillas dentro de `![<valor encriptado>]`

Para llamar una propiedad encriptada en las configuraciones se hace con `${secure::key}`.

Para llamar una propiedad encriptada mediante dateweave es con `Mule::p('secure::key')`.

La llave para desencriptar se puede pasar como variable de entorno al momento de ejecutar la API, en la configuracion del yaml seria asi

![image-20230504144456865](.Mule\secureProperties1.png)

Y el argumento para correr debe ser asi

![image-20230504144559804](.Mule\secureProperties2.png)

Donde `enc.key` es la variable de entorno.

## Errores

El objeto error tiene dos atributos importantes

* error.Description, descripciòn del error
* error.errorType. tipo de error

### OnErrorContinue

### OnErrorPropagate

## DataWeave

### Selectores

| Selector       | Use                                                                                                   | How it works                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| -------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Single-value   | `.keyName`                                                                                            | Any type of value that belongs to a matching key                                                                                                                                                                                                                                                                                                                                                                                                      |
| Multi-value    | `.*keyName`                                                                                           | Array of values of any matching keys                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Descendants    | `..keyName`                                                                                           | Array of values of any matching descendant keys                                                                                                                                                                                                                                                                                                                                                                                                       |
| Dynamic        | See [Dynamic Selector](https://docs.mulesoft.com/dataweave/2.4/dataweave-selectors#dynamic_selector). |                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| Key-value pair | `.&keyName`                                                                                           | Object with the matching key                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Index          | `[<index>]`                                                                                           | Value of any type at selected array index. Use negative numbers to index from the end of an array, for example, `-1` for the last element in the array. Use of numbers beyond the array size returns `null`.                                                                                                                                                                                                                                          |
| Range          | `[<index> to <index>]`                                                                                | Array with values from selected indexes                                                                                                                                                                                                                                                                                                                                                                                                               |
| XML attribute  | `@`, `.@keyName`                                                                                      | String value of the selected attribute                                                                                                                                                                                                                                                                                                                                                                                                                |
| Namespace      | `keyName.#`                                                                                           | String value of the namespace for the selected key                                                                                                                                                                                                                                                                                                                                                                                                    |
| Key present    | `keyName?`, `keyName.@type?`                                                                          | Boolean (`true` if the selected key of an object or XML attribute is present, `false` if not)                                                                                                                                                                                                                                                                                                                                                         |
| Assert present | `keyName!`                                                                                            | String: Exception message if the key is not present                                                                                                                                                                                                                                                                                                                                                                                                   |
| Filter         | `[?(boolean_expression)]`                                                                             | Array or object containing key-value pairs *if* the DataWeave expression returns `true`. Otherwise, returns the value `null`.                                                                                                                                                                                                                                                                                                                         |
| Metadata       | `.^someMetadata`                                                                                      | Returns the value of specified metadata for a Mule payload, variable, or attribute. The selector can return the value of class (`.^class`), content length (`.^contentLength`), encoding (`.^encoding`), mime type (`.^mimeType`), media type (`.^mediaType`), raw (`.^raw`), and custom (`.^myCustomMetadata`) metadata. For details, see [Extract Data](https://docs.mulesoft.com/dataweave/2.4/dataweave-cookbook-extract-data#selector_metadata). |

### Formato decimales

Formato cantidad de descimales de un numero, en este caso con dos decimales

```java
20.3844 as String { format: ".0#"}
```

### Date

para pasar un string del payload a un date se realiza de la siguiente manera:

```typescript
"1198/11/22" as Date {format : "yyyy/MM/dd"}
"22-11-1998" as Date {format : "dd-MM-yyyy"}

"2000-09-22T08:33:12Z" as LocalDateTime {format : "yyyy-MM-dd'T'HH:mm:ss'Z'"}

//Otros 
now() as Date {format : "dd-MM-yyyy"}
now() as Date {format : "dd-MM-yyyy"}

now() as LocalDateTime {format : "HH:mm:ss.SSS"}
now() as LocalDateTime {format : "yyyy-MM-dd HH:mm:ss.SSS"}

now() as Time {format : "HH"}

now() >> "UTC"
now() >> "IST"
now() >> "EST"
(now() >> "UTC") as DateTime {format: "yyyy-MM-dd HH:mm:ss"}
```

### Funciones

* now(), tiempo actual

* sizeOf(arg), tamaño del array del argumento

* isEmpty(arg), si el argumento esta vacio

* upper(string), mayusculas del argumento

* #["$(vars.variable)"], para hacer la variable dentro de un string

* fun nameFunction(args...) = (logica)

* abs(*number*), Valor absoluto

* avg([1,3]), promedio

* ceil(3.2), da 4, valor entero siguiente

* floor(3.2), da 3, valor antero anterior

* round(1.2), aproxima el valor al entero mas cercano

* min(*number[ ]*), el valor minimo del arreglo

* max(*number[ ]*), el valor maximodel arreglo

* [ {"a":1}, {"a":2}, {"a":3} ] minBy (item) -> item.a, el minimo de acuerdo a un atributo especifico 

* [ {"a":1}, {"a":2}, {"a":3} ] maxBy (item) -> item.a, el maximo de acuerdo a un atributo especifico 

* isEven(*number*), retorna true o false si el numero es par o no.

* isOdd(*number*), retorna true o false si el numero es imparo no.

* isInteger(*numer*)

* isDecimal(*number*)

* isBlanj(*arg*)

* isEmpty(*arg*)

* lower(*string*), retorna la cadena en minusculas

* upper(*string*), retorna la cadena en mayusculas

* ***string*** matches(*Regex*), compara contra una exprecion regex

* ***admin123*** replace "123" with("ID"), da como resultado ***adminID***enser

* sizeOf(array[] | object), retorna la cantidad de elementos del argumento1

* namesOf(***obj***), nombres de los atributos del objeto

* entriesOf(***obj***), regresa un objeto por cada entrada del objeto que se pase como argmento, { 
  
  key: nombrePropiedad, 
  
  value: valorPropiedad, 
  
  atributes: {atriutos}
  
  }

* keysOf(***obj***), nombres de los atributos del objeto

* valuesOf(***obj***) valores de los atributos del objeto

* map(item, indexObject) -> { }

* map { 
  
  atributo1: $  //El signo dolar hace referencia al item en los atributos del map
  
  atributo2: $$  //El signo doble dolar hace referencia al index en los atributos del map
  
  }

* mapObject(value, key, index) -> { }

* filter(item, indexObject) -> { }

* filterObject(item, indexObject) -> { }

* distinctBy( item, index ) -> item, retorna los item sin duplicados, compara el objeto completo

* orderBy( item, index ) -> item, va ordenando los objetos del array de acuerdo
  
  orderBy \$.atributo, ordenar por atributo de manera ascendente por defectoorderBy -$.atributo, ordenar por atributo de manera descendente

* groupBy( item, index ) -> { }
  
  groupBy \$.atributo, agrupar por atributo, regresa un nuevo arreglo por cada valor que pueda tomar el atributo

* fooArray filter(\$.atributo == bar).atributo2 joinBy ", ", toma todos los atributos2 de cada objeto y los regresa como una cadena separadas por $', '$

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



### Parametrizados

Para usar variables definidas como parametrizables en la configuracion global se puede mediante la funcion `Mule::p('nombreParametro')`.

Para el mock puede ser necesario usarlo de la manera `read(Mule::p('nombreParametro'))`.

En caso de que sean valores JSON o algo que no se pueda mediante el XML, se puede parametrizar desde un archivo yaml, este debe ser creado en `src/test/resources`, y ser seleccionado en la configuracion global de parametrizacion.



## MUnit - Mule Palette

### Set Event

Componente para setear valores en el Mule Event, como payload, atributos, error o variables.

![image-20230429142117679](.Mule\MUnitSetEvent)

### Test

Crea un nuevo contexto para un test

## MUnit Tools - Mule Palette

### AssertEquals

Se utiliza para realizar las acerciones del test

### AssertThat

Hace la acercion con una expresion o funcion

![image-20230429151111876](.Mule\MUnitToolsAssertThat)

### AssertExpression

Hace la acercion con una expresion o funcion

![image-20230429160344844](.Mule\MUnitToolsAssertExpression)

### Verify call

Validar cuantas veces fue llamado algo o si fue llamado, su interfaz es similar a la de un mock

### Spy

 Va despues de un mock, y tiene dos secciones, *before call* y *after call*, cada una acepta asserciones para verificar el llamado de un proceso en especifico, no tiene que ser necesariamente el que se mockea

## Importar un archivo en Dataweave

El archivo debe ser de extencion `.dwl`

```js
//Archivo.dwl
import * from dw::test::Asserts
---
 payload must equalTo({
    "message": "Probando MUnit"
})
```



```python
%dw 2.0
import carpeta::archivo

---
archivo::main({ args... })
```

importar tambien datos como por ejemplo un el attributes del Mule event desde un archivo `.dwl`

```js
//Archivo.dwl
{
    "queryParams": {
        "param1": 123,
        "param2": "Prueba"
    }
}
```

Desde un setEvent se podria llamar asi

![image-20230429180744524](.Mule\MUnitSetEvent2)



## Mocks

Se usa el componente Mock when, cuando se selecciona el procesador, es el componente o seccion que se va a mockear y se recomienda hacerlo mediante el `doc:id`. 

En la sección `Then Return` es donde se asignan los valores al Mule event





# Security Schemas

## OAuth 2.0

```yaml
securitySchemes:
  oauth2.0:
    type: OAuth 2.0
    describedBy:
            headers:
                Authorization:
                    description: |
                      Used to send a valid OAuth 2 access token. Do not use
                      with the "access_token" query string parameter.
                    type: string
            queryParameters:
                access_token:
                    description: |
                      Used to send a valid OAuth 2 access token. Do not use together with
                      the "Authorization" header
                    type: string
            responses:
                401:
                    description: |
                        Bad or expired token.
                403:
                    description: |
                        Bad OAuth request.
    settings:
      authorizationUri: http://0.0.0.0:8081/authorize
      accessTokenUri: http://0.0.0.0:8081/access-token
      authorizationGrants: [authorization_code, password, client_credentials, implicit]
```

## Basic

```yaml
securitySchemes:
  basic:
    type: Basic Authentication
    description: La API esta protegida por autenticación basica
```

