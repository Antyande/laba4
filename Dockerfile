FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /myapp

# Copy and build
COPY . .
RUN dotnet publish app/MyApp.csproj -c Release -o out

WORKDIR /myapp/out
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "MyApp.dll"]
