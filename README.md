# kwekash

**kwekash** is a shell utility to easily run `weka` commands on the first available matching pod in your WEKA Kubernetes cluster.

It supports default actions, interactive mode, real-time monitoring via `watch`, multiple kubeconfig contexts, and advanced pod/namespace targeting.

---

## 🔧 Installation

```bash
git clone https://github.com/ropeck/kwekash.git
cd kwekash
make install
```

This installs:
- The `kwekash` command to `~/bin` or `~/.local/bin`
- The manual page to `~/.local/share/man/man1/`

---

## 🧰 Usage

```bash
kwekash [--kubeconfig <path>] [--namespace <ns>] [--pod <pattern>] [-it] [watch [watch-options]] [weka subcommand]
```

### 📘 Examples

| Command                                                  | Description                                                  |
|-----------------------------------------------------------|--------------------------------------------------------------|
| `kwekash`                                                 | Run `weka status` on the first matching pod                 |
| `kwekash status`                                          | Run `weka status`                                           |
| `kwekash local ps`                                        | Run `weka local ps`                                         |
| `kwekash -it`                                             | Open interactive shell on the first matching pod            |
| `kwekash watch status`                                   | Watch `weka status` every 2 seconds                         |
| `kwekash watch -n 2 local ps`                            | Watch `weka local ps` every 2 seconds                       |
| `kwekash --kubeconfig ~/.kube/staging`                   | Use an alternate kubeconfig file                            |
| `kwekash --namespace dev --pod frontend status`    | Target a pod matching "frontend" in the "dev" namespace     |

---

## 🔧 Advanced Pod Targeting

Use these flags to customize the pod and namespace selection:

| Option                  | Description                                                   |
|-------------------------|---------------------------------------------------------------|
| `--namespace <name>`    | Set the Kubernetes namespace (default: `weka-operator-system`) |
| `--pod <pattern>` | Match a pod name substring (default: `drive`)                 |

---

## 🌐 Kubeconfig Support

- Specify a kubeconfig using `--kubeconfig <path>`
- If not passed, `$KUBECONFIG` is used
- If neither is set, `kwekash` will exit with an error

---

## 🔍 Requirements

- `kubectl` or [`kubecolor`](https://github.com/hidetatz/kubecolor)
- A running WEKA cluster with pods (default: drive pods)
- `watch` utility (installed in WEKA CLI containers)

---

## 📖 Manual Page

```bash
man kwekash
```

If needed on macOS:

```bash
echo 'export MANPATH=$HOME/.local/share/man:$MANPATH' >> ~/.zshrc
source ~/.zshrc
```

---

## 📝 License

MIT
