oc new-app postgresql-persistent \
    --param=DATABASE_SERVICE_NAME=inventory-postgresql \
    --param=POSTGRESQL_DATABASE=inventory \
    --param=POSTGRESQL_USER=inventory \
    --param=POSTGRESQL_PASSWORD=inventory \
    --labels=app=inventory

# Catalog DB
oc new-app postgresql-persistent \
    --param=DATABASE_SERVICE_NAME=catalog-postgresql \
    --param=POSTGRESQL_DATABASE=catalog \
    --param=POSTGRESQL_USER=catalog \
    --param=POSTGRESQL_PASSWORD=catalog \
    --labels=app=catalog
