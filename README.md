# kwekash

**kwekash** is a Python utility to easily run `weka` commands on the first available matching pod in your WEKA Kubernetes cluster.

It supports:
- `--namespace`, `--pod-match`, `--kubeconfig`
- Default `weka status` behavior
- Interactive shell with `-it`
- Periodic status monitoring via `watch`

## 🔧 Installation

```bash
make install
```

This installs:
- The `kwekash` Python script to `~/bin` or `~/.local/bin`
- The manual page to `~/.local/share/man/man1/`

## 🧰 Usage

```bash
kwekash [--kubeconfig <path>] [--namespace <ns>] [--pod-match <pattern>] [-it] [watch [watch-options]] [weka-subcommand]
```

## 📘 Examples

| Command                                                  | Description                                                  |
|-----------------------------------------------------------|--------------------------------------------------------------|
| `kwekash`                                                 | Run `weka status` on the first matching pod                 |
| `kwekash status`                                          | Run `weka status`                                           |
| `kwekash local ps`                                        | Run `weka local ps`                                         |
| `kwekash -it`                                             | Open interactive shell on the first matching pod            |
| `kwekash watch status`                                    | Watch `weka status` every 2 seconds                         |
| `kwekash watch -n 2 local ps`                             | Watch `weka local ps` every 2 seconds                       |
| `kwekash --kubeconfig ~/.kube/staging`                    | Use a specific kubeconfig                                   |
| `kwekash --namespace dev --pod-match frontend status`     | Match a different namespace and pod pattern                 |

## 🔍 Requirements

- Python 3.6+
- `kubectl` or `kubecolor`
- WEKA drive pods running in your cluster

## 📖 Manual Page

```bash
man kwekash
```

To enable manpages on macOS:

```bash
echo 'export MANPATH=$HOME/.local/share/man:$MANPATH' >> ~/.zshrc
source ~/.zshrc
```

## 📝 License

MIT
