# HashiCorp Consul \w Docker Compose

A working example for service discovery with nginx load-balancing.

## Services Endpoint

- Consul dashboard: http://localhost:8500
- Example web app: http://localhost:9090

## Usage

#### Starting the cluster:

```sh
./service start
```

#### Scalling the cluster:

```sh
./service scale web=10
```


#### Stopping the cluster:

```sh
./service stop
```

#### Check the process of the cluster:

```sh
./service ps
```

#### Ouput the cluster logs:

```sh
./service logs
