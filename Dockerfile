# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["./ToDoApi.csproj", "./"]
RUN dotnet restore "./ToDoApi.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "./ToDoApi.csproj" -c Release -o /app/build

# Publish the application
FROM build AS publish
RUN dotnet publish "./ToDoApi.csproj" -c Release -o /app/publish

# Final stage: build the runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ToDoApi.dll"]
