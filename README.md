# tp_proteus_tools
proteus flutter project tools

## 使用方式

1. 默认创建 Flutter 工程

    ```bash
    sh proteus_cli.sh
    ```
    这将在当前目录创建名为 MyFlutterApp 的 Flutter 工程。

2. 指定工程名称

    ```bash
    sh proteus_cli.sh -n PokrraGame
    ```
    这将在当前目录创建 PokrraGame 项目。

3. 指定工程名称和存放目录

    ```bash
    sh proteus_cli.sh -n PokrraGame -d ~/Projects
    ```
    这将在 `~/Projects` 目录下创建 PokrraGame 项目。



##安装方式

1. 使用.zshrc 环境变量

```
mkdir -p "$HOME/.tp_proteus_tools" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/open4games/tp_proteus_tools/main/proteus_cli.sh)" && echo 'export PATH="$HOME/.tp_proteus_tools:$PATH"' >> ~/.zshrc && source ~/.zshrc
```


2. 使用.bash_profile 环境变量
```
mkdir -p "$HOME/.tp_proteus_tools" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/open4games/tp_proteus_tools/main/proteus_cli.sh)" && echo 'export PATH="$HOME/.tp_proteus_tools:$PATH"' >> ~/.bash_profile && source ~/.bash_profile
```