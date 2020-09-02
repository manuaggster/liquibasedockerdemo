FROM maven:3.5-jdk-8

LABEL MANTEINER="manu garg"


WORKDIR /usr/local/liquibase

#COPY lib/liquibase-core-3.5.3.jar /tmp/liquibase-core-3.5.3.jar

COPY pom.xml /usr/local/liquibase/pom.xml
#COPY lib/liquibase.properties /usr/local/liquibase/liquibase.properties
COPY db/dbchangelog.yml /usr/local/liquibase/dbchangelog.yml
COPY db/dbchangelogtest.xml /usr/local/liquibase/dbchangelogtest.xml
COPY db/dbchangelogtestRollback.xml /usr/local/liquibase/dbchangelogtestRollback.xml


COPY liquibase.properties /usr/local/liquibase/liquibase.properties
COPY master.xml /usr/local/liquibase/master.xml



ENV LIQUIBASE_PROJECT_DIR=.
ENV   LIQUIBASE_DATABASE_DRIVER=org.postgresql.Driver
ENV   LIQUIBASE_DATABASE_URL=jdbc:postgresql://commerce-postgresql.postgres-ns.svc.cluster.local:5432/postgres}
ENV  LIQUIBASE_DATABASE_USERNAME=postgres
ENV  LIQUIBASE_DATABASE_PASSWORD=postgres
ENV LIQUIBASE_CHANGELOG=master.xml


ENTRYPOINT ["mvn","-e", "liquibase:update","-Dmaven.test.skip=true"]	


  
