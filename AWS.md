# AWS

## IAM

* Se genera un  usuario root por default

* se declara en un archivo JSON de politicas
  
  ```json
  {
    Version: "2012-10-17",
    Id: "S3-account",
    Statement: [
      {
        Sid: "1",
        Effect: "Allow",
        Principal: {
          AWS: ["arn:aws:iam..."],
        },
        Action: [
          's3:GetObject',
          's3:PutObject'
        ],
        Resource: ['arn:aws:s3....']
      },
    ],
  }
  ```
  
  * **Version**: Version del lenguaje de la politica
  
  * **id (Optional):** Identificador de la politica
  
  * **Statement (Required)**: arreglo de declaraciones
    
    * **Sid (Optional)**: Un identificador del statement
    
    * **Effect**: Si permite o deniega el acceso.
    
    * **Principal**: Cuenta/Usuario al que se le aplica la politica
    
    * **Action**: Lista de acciones que se Permiten/Deniegan
    
    * **Resource**: Lista de recursos a los que aplica las acciones.
    
    * **Condition (Optional)**: Condicion para cuando esta activa
