# Kafka

En .\bin\windows\

```shell
## Iniciar zookeeper
.\zookeeper-server-start.bat .\config\zookeeper.properties
## Iniciar apache kafka
.\kafka-server-start.bat .\config\server.properties

## Listar topicos
.\kafka-topics.bat --list --zookeeper localhost: 2181

## Crear topicos
.\kafka-topics.bat --create--zookeeper localhost: 2181 --replication-factor --partitions 1 --topic topico-example

## Crear productor
.\kafka-console-producer.bat --broker-list localhost:9092 --topic topico-example

## Crear consumidor
.\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic topico-example --from-beginning

## Detener kafka
.\kafka-server-stop.bat


## Detener zeepeker
.\zookeeper-server-stop.bat
```


