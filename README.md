# jibjib-setup
Easy setup for the fabulous [JibJib](https://github.com/gojibjib/jibjib) service with `docker stack`.

First build the JibJib API Service image:

```sh
git clone https://github.com/gojibjib/jibjib-api
cd jibjib-api
docker build --tag=jibjib .
cd ..
```

Then clone this repository:

```sh
git clone https://github.com/jdobber/jibjib-setup.git
cd jibjib-setup
```

Set the environment and fetch all additional assets (model etc.). This fetch approx. 500 MB and
may take some time:

```sh
source ./set_env.sh 
./setup.sh
```

Pull all other images:

```sh
docker pull obitech/tensorflow-serving:devel-cpu
docker pull obitech/jibjib-query
```

Then deploy the stack (maybe you need to perfom `docker swarm init` before):

```sh
docker stack deploy -c docker-compose.yml --prune jibjib
```

Wait for MongoDB to show up (use `docker ps` to check):

Then run (and only once):

```sh
./init_mongodb.sh
```

Check the service at: http://<your_ip>:8000

See [here](https://github.com/gojibjib/jibjib-api) for API endpoints and documentation about how
to query the service.

Finally, If you want to stop the service and remove the stack:

```sh
docker stack rm jibjib
```
