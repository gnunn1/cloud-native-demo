# Inventory ConfigMap
cat <<EOF > ./project-defaults.yml
swarm:
  datasources:
    data-sources:
      InventoryDS:
        driver-name: postgresql
        connection-url: jdbc:postgresql://inventory-postgresql:5432/inventory
        user-name: inventory
        password: inventory
EOF


oc create configmap inventory --from-file=project-defaults.yml=./project-defaults.yml
oc set volume dc/inventory --add --configmap-name=inventory --mount-path=/app/config
oc set env dc/inventory JAVA_ARGS="-s /app/config/project-defaults.yml"

# Catalog Config Map
cat <<EOF > ./application.properties
spring.datasource.url=jdbc:postgresql://catalog-postgresql:5432/catalog
spring.datasource.username=catalog
spring.datasource.password=catalog
spring.datasource.driver-class-name=org.postgresql.Driver
spring.jpa.hibernate.ddl-auto=create
EOF

oc create configmap catalog --from-file=application.properties=./application.properties
oc delete pod -l app=catalog
