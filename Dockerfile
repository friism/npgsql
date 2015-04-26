FROM microsoft/aspnet:nightly

ADD . /src
WORKDIR /src
RUN xbuild src/Npgsql/Npgsql.csproj /p:Configuration=Release-net45
RUN dnu restore test/Npgsql.EntityFramework7.FunctionalTests
RUN dnu build test/Npgsql.EntityFramework7.FunctionalTests
