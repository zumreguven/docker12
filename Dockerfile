# Java 8 JDK tabanlı image kullanıyoruz (GlassFish 4.1.1 için uyumlu)
FROM openjdk:8-jdk

# Çalışma dizinini /opt olarak belirle
WORKDIR /opt

# unzip paketini yükle (wget yok, zip dosyasını biz kopyalıyoruz)
RUN apt-get update && apt-get install -y unzip && apt-get clean

# GlassFish zip dosyasını konteynere kopyala (aynı klasörde olmalı)
COPY glassfish-4.1.1.zip /opt/

# Zip dosyasını aç ve ardından zip dosyasını sil
RUN unzip glassfish-4.1.1.zip && rm glassfish-4.1.1.zip

# GlassFish kurulum dizini
ENV GLASSFISH_HOME=/opt/glassfish4

# WAR dosyasını GlassFish otomatik deploy klasörüne kopyala
COPY jsf-exercise-1.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/

# GlassFish uygulamalar 8080 portunu kullanır, dışarıya 8090 portunu aç
EXPOSE 8080

# GlassFish domain'i başlat ve logları takip et (container açık kalır)
CMD ["sh", "-c", "$GLASSFISH_HOME/bin/asadmin start-domain && tail -f $GLASSFISH_HOME/glassfish/domains/domain1/logs/server.log"]
