FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

WORKDIR /app

EXPOSE 8000

RUN apt-get update \
 && apt-get install -y --allow-unauthenticated \
 libc6-dev \
 libgdiplus \
 libx11-dev \
 && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :99
ENV ASPNETCORE_URLS=http://+:8000
ENV DisableHttpsRedirection=true
ENV POSTGRES_PASSWORD: postgres

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["./DM_Aspnet_Webapi.csproj", "./"]

RUN dotnet restore "./DM_Aspnet_Webapi.csproj"
COPY . .

WORKDIR "/src/."

RUN dotnet build "DM_Aspnet_Webapi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DM_Aspnet_Webapi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DM_Aspnet_Webapi.dll"]

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone