FROM microsoft/dotnet:2.0-sdk

RUN apt-get update && apt-get install -y \
  curl \
  jq \
  unzip

ENV SONAR_SCANNER_MSBUILD_VERSION 4.0.2.892

# Sonar Scanner MSBuild
ADD "https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/${SONAR_SCANNER_MSBUILD_VERSION}/sonar-scanner-msbuild-${SONAR_SCANNER_MSBUILD_VERSION}.zip" /tmp/sonar-scanner-msbuild.zip
RUN mkdir -p /usr/bin/sonar-scanner-msbuild/
RUN unzip -XK "/tmp/sonar-scanner-msbuild.zip" -d /usr/bin/sonar-scanner-msbuild/
RUN find /usr/bin/sonar-scanner-msbuild/ -name 'sonar-scanner' -exec chmod +x {} \;
RUN apt-get update && apt-get install -y \
  openjdk-8-jre

# Mono
ENV MONO_VERSION 5.4.1.6

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  && apt-get install -y mono-runtime \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN apt-get update \
  && apt-get install -y binutils curl mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Clean up
RUN dotnet nuget locals --clear all
RUN rm -rf /var/lib/apt/lists/* /tmp/* /usr/share/dotnet/sdk/NuGetFallbackFolder

COPY ./sonar-wrapper /usr/bin

ENTRYPOINT ["sonar-wrapper"]
