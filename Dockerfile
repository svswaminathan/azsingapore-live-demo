FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS base
WORKDIR /app
EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80

FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build
WORKDIR /src
COPY ["azsingapore-live-demo.csproj", "./"]
RUN dotnet restore "azsingapore-live-demo.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "azsingapore-live-demo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "azsingapore-live-demo.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "azsingapore-live-demo.dll"]
