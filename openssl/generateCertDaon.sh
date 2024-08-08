#!/bin/bash
echo "Generating certificate for Daon"
keytool -genkeypair -alias keypdn -keyalg RSA -keysize 2048 -validity 180 -keystore keypdnstore.jks -storepass mypassword -keypass mypassword -dname "CN=nequigt, OU=nequigt, O=nequi, L=gt, ST=gt, C=gt" -storetype JCEKS
keytool -importkeystore -srckeystore keypdnstore.jks -destkeystore keypdnstore.p12 -srcstoretype JCEKS  -deststoretype PKCS12 -srcstorepass mypassword -deststorepass mypassword -srcalias keypdn -destalias keypdn -srckeypass mypassword -destkeypass mypassword
keytool -exportcert -alias keypdn -keystore keypdnstore.p12 -storepass mypassword -rfc -file my_public_certificate.pem
openssl pkcs12 -in keypdnstore.p12 -nocerts -nodes -out private_key_uc.pem -passin pass:mypassword
echo "Certificate for Daon generated successfully"

