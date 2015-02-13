{% from "server-204/map.jinja" import pip with context %}

docker.io:
  pkg.installed

mongodb_mongo_1:
  docker.running:
    - container: mongodb_mongo_1

jenkins_myjenkins_1:
  docker.running:
    - container: jenkins_myjenkins_1
