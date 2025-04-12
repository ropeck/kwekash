# kwekash

**kwekash** is a shell utility to easily run `weka` commands on the first available drive pod in your WEKA Kubernetes cluster.

## Installation

```bash
git clone https://github.com/ropeck/kwekash.git
cd kwekash
make install
```

## Usage

```bash
kwekash                # Interactive shell on WEKA drive pod
kwekash status         # Run 'weka status'
kwekash local ps       # Run 'weka local ps'
kwekash --help         # Show usage
```

## Remove

```bash
cd kwekash
make uninstall
```

## Requirements

- `kubectl` (configured for your cluster)
- `kubecolor` (drop-in replacement for `kubectl` with color output)
- A running WEKA deployment with drive pods in the `weka-operator-system` namespace

## License

MIT
