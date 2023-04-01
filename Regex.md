# Regex

~~~js
 const regex = /^a/
~~~

| expresion  | que hace                                                     | notas                                                        |
| ---------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| /^a/       | se cumple si comienza por "a"                                | se puede combinar con $                                      |
| /b$/       | se cumple si termina en b                                    | se puede combinar con ^ /^b$/                                |
| /algo\b/   | debe contener "algo" como una palabra                        |                                                              |
| /^b\*e\*$/ | Se puede repetir la b la cantidad de veces que se quiera pero debe haber una e, que tambien se puede repetir las cosas que se quiera |                                                              |
| /^b+e\*$/  | debe empezar por b, esta b se puede repetir la cantidad de veces que se quiera y luego debe seguir una e, que es opcional. | la diferencia entre + y * es que * queda como opcional la e, puede que exista o no |
| /^b+e?$/   | La e es opcional, puede estar una vez o no estar             |                                                              |
| ^be{1,2}$/ | tiene que terminar en e, la e se puede repetir en el rango de 1 a 2 | si no se coloca parametro final, es que se puede repetir la cantidad de veces que se quiera sin limite |
| /a.*?b/    | El punto es que puede haber cualquier cosa entre a y b, el * que se puede repetir varias veces y el ? para que acada vez que termine en b y encuentre otra a inicie una nueva validacion y no se la misma | si tengo /avvbasssb/, hara dos validaciones o regresara un arreglo con dos objetos. ["avvb", "asssb"] |
| /a.*?b/g   |                                                              | la g se coloca para que evalue todo el texto, validad si es solo en JS o en otros lenguajes ambien |
| /^\d+$/    | el \d es para numeros                                        |                                                              |
| /^\D+$/    | Es validar sea cualquier cosa que no sea un numero           |                                                              |
| /^\w+$/    | Que sea alfa numerico                                        |                                                              |
| /^a\|b$/   | Puede ser a o b                                              | \| es como el condicional OR                                 |
