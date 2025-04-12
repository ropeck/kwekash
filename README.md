# kwekash

**kwekash** is a shell utility to easily run `weka` commands on the first available drive pod in your WEKA Kubernetes cluster.

It supports default actions, interactive mode, real-time monitoring via `watch`, and multiple kubeconfig contexts.

---

## 🔧 Installation

```bash
git clone https://github.com/yourusername/kwekash.git
cd kwekash
make install
```

This installs:
- The `kwekash` command to `~/bin` or `~/.local/bin`
- The manual page to `~/.local/share/man/man1/`

---

## 🧰 Usage

```bash
kwekash [--kubeconfig <path>] [-it] [watch [watch-options]] [weka subcommand]
```

### 📘 Examples

| Command                                 | Description                                      |
|----------------------------------------|--------------------------------------------------|
| `kwekash`                               | Run `weka status` on the pod (default)          |
| `kwekash status`                        | Run `weka status` explicitly                    |
| `kwekash local ps`                      | Run `weka local ps`                             |
| `kwekash -it`                           | Open an interactive shell on the pod            |
| `kwekash watch status`                 | Watch `weka status` on the pod in real-time     |
| `kwekash watch -n 2 local ps`          | Watch `weka local ps` every 2 seconds           |
| `kwekash --kubeconfig ~/.kube/stage`   | Use a specific kubeconfig context               |

---

## 🌐 Kubeconfig Support

- You can specify a kubeconfig using `--kubeconfig <path>`
- If `--kubeconfig` is not passed, it will fall back to the `KUBECONFIG` environment variable
- If neither is set, `kwekash` will exit with an error

---

## 🔍 Requirements

- `kubectl` (or [`kubecolor`](https://github.com/hidetatz/kubecolor), preferred if installed)
- A running WEKA cluster with drive pods in the `weka-operator-system` namespace
- `watch` utility available in the pod (usually pre-installed in WEKA pods)

---

## 📖 Manual Page

To view the manual:

```bash
man kwekash
```

If needed, ensure `~/.local/share/man` is in your `MANPATH`:

```bash
export MANPATH="$HOME/.local/share/man:$MANPATH"
```

---

## 📝 License

MIT
