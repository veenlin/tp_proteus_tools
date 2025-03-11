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
    sh proteus_cli.sh -n xxxx
    ```
    这将在当前目录创建 xxxx 项目。

3. 指定工程名称和存放目录

    ```bash
    sh proteus_cli.sh -n xxxx -d ~/Projects
    ```
    这将在 `~/Projects` 目录下创建 xxxx 项目。



##安装方式

1. 使用.zshrc 环境变量

```
mkdir -p ~/.tp_proteus_tools ~/bin && curl -fsSL https://raw.githubusercontent.com/veenlin/tp_proteus_tools/refs/heads/main/proteus_cli.sh -o ~/.tp_proteus_tools/proteus_cli.sh && chmod +x ~/.tp_proteus_tools/proteus_cli.sh && ln -sf ~/.tp_proteus_tools/proteus_cli.sh ~/bin/proteus_cli && grep -qxF 'export PATH="$HOME/bin:$PATH"' ~/.zshrc || echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
```


2. 使用.bash_profile 环境变量
```
mkdir -p ~/.tp_proteus_tools ~/bin && curl -fsSL https://raw.githubusercontent.com/veenlin/tp_proteus_tools/refs/heads/main/proteus_cli.sh -o ~/.tp_proteus_tools/proteus_cli.sh && chmod +x ~/.tp_proteus_tools/proteus_cli.sh && ln -sf ~/.tp_proteus_tools/proteus_cli.sh ~/bin/proteus_cli && grep -qxF 'export PATH="$HOME/bin:$PATH"' ~/.bash_profile || echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bash_profile && source ~/.bash_profile
```