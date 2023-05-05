#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Web.WokerService/Web.WokerService.csproj", "Web.WokerService/"]
COPY ["PostgresDBData/PostgresDBData.csproj", "PostgresDBData/"]
COPY ["Web.Models/Web.Models.csproj", "Web.Models/"]
COPY ["Web.Utils/Web.Utils.csproj", "Web.Utils/"]
COPY ["Web.AppCore/Web.AppCore.csproj", "Web.AppCore/"]
COPY ["Web.Caching/Web.Caching.csproj", "Web.Caching/"]
COPY ["Web.MessageQ/Web.MessageQ.csproj", "Web.MessageQ/"]
COPY ["Web.Stockets/Web.Stockets.csproj", "Web.Stockets/"]
COPY ["Web.Storage/Web.Storage.csproj", "Web.Storage/"]
COPY ["Web.Infrastructure/Web.Infrastructure.csproj", "Web.Infrastructure/"]
RUN dotnet restore "Web.WokerService/Web.WokerService.csproj"
COPY . .
WORKDIR "/src/Web.WokerService"
RUN dotnet build "Web.WokerService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Web.WokerService.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Web.WokerService.dll"]