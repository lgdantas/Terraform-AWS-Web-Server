COUNTRY=BR
STATE=SP
LOCALITY=SP
ORGANIZATION=Sample
COMMONNAME=sample.aws
EMAIL=admin@sample.aws
PASSPHRASE=""

# Create the CA cert
openssl req \
    -new \
    -newkey rsa:2048 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$COMMONNAME/emailAddress=$EMAIL" \
    -keyout ca_pvtk.key \
    -out    ca_cert.crt

# Create the domain cert request
openssl req \
        -new \
        -nodes \
        -newkey rsa:2048 \
        -keyout sample_pvt.key \
        -out    sample_pvt.req \
        -batch \
        -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=*.$COMMONNAME/emailAddress=$EMAIL" 


# Sign the domain cert.
openssl x509 \
        -req \
        -in sample_pvt.req \
        -CA ca_cert.crt \
        -CAkey ca_pvtk.key \
        -CAcreateserial \
        -out sample_pvt.crt \
        -days 3650 \
        -sha256 

# convert to PEM to be loaded on ACM.
openssl rsa  -in sample_pvt.key  -outform PEM -out sample_pvtk.pem 
openssl x509 -in sample_pvt.crt -inform  PEM  >    sample_pvtc.pem
