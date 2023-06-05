
# local-snowplow

This project allows anyone to launch quickly a local snowplow pipeline using docker-compose. It is directed at developers that are building new or existing loaders that consume enriched data produced by a snowplow pipeline.


## Run Locally

Clone the project

```bash
  git clone https://github.com/jrluis/local-snowplow
```

Go to the project directory

```bash
  cd local-snowplow/pipeline
```

Start the pipeline

```bash
  docker-compose up
```


## Documentation

This project uses local stack to simulate aws on your local computer.

When the docker compose boots up the containers, it follows the logical init sequence as defined by:

  1. postgres launch 
  2. iglu db init
  3. iglu web server launch
  4. local stack launch
  5. local stack kinesis streams management
  6. snowplow collector web server launch
  7. snowplow enricher app launch

The endpoints to use the pipeline are:

  * collector -> http://127.0.0.1:8080
  * iglu -> http://127.0.0.1:8081
  * postgres -> http://127.0.0.1:5432
  * local stack -> http://127.0.0.1:4566

The default development credentials can be found in the docker compose file, these are development credentials and should never be used in a production deployment.

### Questions

1. Where can I query the bad rows?

The docker compose file and config are setup for the bad rows to appear in /tmp/enrich-tmp/bad-rows. 
The bad-rows file is rotated every time the docker compose is rebooted.


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Authors

- [@jrluis](https://github.com/jrluis)

