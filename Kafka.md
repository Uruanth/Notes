# Kafka

En .\bin\

```shell
## Iniciar zookeeper
.\windows\zookeeper-server-start.bat .\config\zookeeper.properties
## Iniciar apache kafka
.\windows\kafka-server-start.bat .\config\server.properties

## Listar topicos
.\windows\kafka-topics.bat --list --bootstrap-server localhost:9092

## Crear topicos
.\windows\kafka-topics.bat --create --topic quickstart-events --bootstrap-server localhost:9092

## Crear productor
.\windows\kafka-console-producer.bat --topic quickstart-events --bootstrap-server localhost:9092

## Crear consumidor
.\windows\kafka-console-consumer.bat --topic quickstart-events --from-beginning --bootstrap-server localhost:9092

## Detener kafka
.\windows\kafka-server-stop.bat


## Detener zeepeker
.\windows\zookeeper-server-stop.bat
```
