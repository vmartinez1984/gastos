FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /publish
EXPOSE 80
COPY bin/Release/net6.0/publish .
ENTRYPOINT ["dotnet","Gastos.Mvc.dll"]

#docker build -t gastos_dotnet . -f "Dockerfile"