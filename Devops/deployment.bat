@REM build images web-api
docker build -t web-api-test ../Backend/.

@REM kubectl -n mta get pod -o wide