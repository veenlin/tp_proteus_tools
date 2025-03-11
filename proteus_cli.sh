#!/bin/bash

# 设置默认工程名称
PROJECT_NAME="myflutterapp"
# 设置默认工程目录
PROJECT_DIR="./"

# 解析命令行参数
while getopts ":n:d:" opt; do
  case $opt in
    n) PROJECT_NAME="$OPTARG";;  # 设置项目名称
    d) PROJECT_DIR="$OPTARG";;   # 设置项目目录
    \?) echo "无效参数: -$OPTARG" >&2; exit 1;;
  esac
done

# 检查 Flutter 是否安装
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter 未安装，请先安装 Flutter。"
    exit 1
fi

# 进入目标目录
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# 创建 Flutter 工程
echo "🚀 正在创建仅支持 iOS 和 Android 的 Flutter 工程：$PROJECT_NAME..."
flutter create --platforms=ios,android "$PROJECT_NAME"

# 克隆 tp_proteus 代码仓库
echo "📥 克隆 tp_proteus 代码仓库..."
git clone git@github.com:open4games/tp_proteus.git

# 拷贝 template 目录内容到新创建的工程
echo "📁 拷贝 template 目录内容到新工程..."
cp -r ./tp_proteus/template/* "$PROJECT_NAME/"

cp -r ./tp_proteus/make.sh "$PROJECT_NAME/"

# 替换 pubspec.yaml 文件中的 dependencies 和 dev_dependencies
echo "🔄 替换 pubspec.yaml 文件中的 dependencies 和 dev_dependencies..."
sed -i '' '/dependencies:/,/dev_dependencies:/c\
dependencies:\
  flutter:\
    sdk: flutter\
  freezed_annotation: ^2.4.1\
  json_annotation: ^4.9.0\
  hooks_riverpod: ^2.4.9\
  flutter_hooks: ^0.20.5\
  get_it: ^8.0.3\
  go_router: ^14.8.1\
\
  # The following adds the Cupertino Icons font to your application.\
  # Use with the CupertinoIcons class for iOS style icons.\
  cupertino_icons: ^1.0.8\
  theme:\
    path: packages/theme\
  localization:\
    path: packages/localization\
  webview:\
    path: packages/webview\
  router:\
    path: packages/router\
  network_helper:\
    path: plugins/network_helper\
  janus_switcher:\
    path: plugins/janus_switcher\
\
dev_dependencies:\
  build_runner: ^2.4.8\
  freezed: ^3.0.0-0.0.dev\
  json_serializable: ^6.7.1\
' "$PROJECT_NAME/pubspec.yaml"

# 删除克隆的 tp_proteus 目录
echo "🗑️ 删除 临时的 tp_proteus 目录..."
rm -rf ./tp_proteus
rm -rf ./$PROJECT_NAME/test

# 进入 Flutter 项目目录
cd "$PROJECT_NAME" || exit

echo `pwd`

# 执行 make.sh
if [ -f "./make.sh" ]; then
    echo "🚀 执行 make.sh ..."
    chmod +x ./make.sh  # 确保 make.sh 可执行
    ./make.sh
else
    echo "⚠️ 警告: make.sh 文件不存在，跳过执行。"
fi

# 提示用户完成
echo "✅ Flutter 工程创建完成！"
echo "📂 项目目录: $(realpath .)"