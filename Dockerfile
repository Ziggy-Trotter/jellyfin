FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

COPY . ./
RUN dotnet publish Jellyfin.Server --configuration Release --output /out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /jellyfin
COPY --from=build /out .

EXPOSE 8096
ENTRYPOINT ["./jellyfin"]
