export PROJECT_NAME=coolstore

echo "Create project"

oc new-project $PROJECT_NAME
oc policy add-role-to-user view -n $PROJECT_NAME -z default

echo "Deploying services..."

cd inventory-wildfly-swarm
mvn fabric8:deploy
cd ../catalog-spring-boot
mvn fabric8:deploy
cd ../gateway-vertx
mvn fabric8:deploy

echo "Deploying frontend"
oc new-app nodejs:8~https://github.com/openshift-labs/cloud-native-labs.git#ocp-3.10 \
        --context-dir=web-nodejs \
        --name=web
oc expose svc/web

