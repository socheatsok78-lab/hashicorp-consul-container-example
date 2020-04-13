# HashiCorp Consul \w Docker Compose

A working example for service discovery with nginx load-balancing.

## Usage

#### Starting the cluster:

```sh
./service.sh start
```

#### Scalling the cluster:

```sh
./service.sh scale web=10
```


#### Stopping the cluster:

```sh
./service.sh stop
```

#### Check the process of the cluster:

```sh
./service.sh ps
```

#### Ouput the cluster logs:

```sh
./service.sh logs
