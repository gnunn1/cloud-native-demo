# Inventory ConfigMap
oc create configmap inventory --from-file=project-defaults.yml=./project-defaults.yml
oc set volume dc/inventory --add --configmap-name=inventory --mount-path=/app/config
oc set env dc/inventory JAVA_ARGS="-s /app/config/project-defaults.yml"

# Catalog Config Map
oc create configmap catalog --from-file=application.properties=./application.properties
# Delete pod to update config