# multi stage build docker file (https://spring.io/guides/topicals/spring-boot-docker/), the "as build" is a way to naming the phase 'build', 'as' is a reserved word
FROM openjdk:11.0.11-jdk-oraclelinux7 as build
WORKDIR /workspace/app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src


RUN ./mvnw install -DskipTests
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)


FROM openjdk:11.0.11-jdk-oraclelinux7
VOLUME /tmp
ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","au.gov.nla.ReferenceAppApplication"]