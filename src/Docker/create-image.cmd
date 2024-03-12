docker build --no-cache -f Dockerfile\Dockerfile.PgCompeng -t datalens/pg-compeng .
docker build --no-cache -f Dockerfile\Dockerfile.PgUs -t datalens/pg-us .
docker build --no-cache -f Dockerfile\Dockerfile.Us -t datalens/us .
docker build --no-cache -f Dockerfile\Dockerfile.ControlApi -t datalens/control-api .
docker build --no-cache -f Dockerfile\Dockerfile.DataApi -t datalens/data-api .
docker build --no-cache -f Dockerfile\Dockerfile.UI -t datalens/ui .
