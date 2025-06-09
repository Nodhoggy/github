
parent_folder="/home/huo/code/tsn_omc"
backend_folder="$parent_folder/backend"
frontend_folder="$parent_folder/frontend"


if [ -d "$parent_folder" ]; then
    echo "父文件夹 $parent_folder 存在。"


    if [ -d "$backend_folder" ]; then
        echo "backend 文件夹存在，正在启动..."
        cd "$backend_folder"
        npm run start &
        echo "backend 已启动。"
    else
        echo "backend 文件夹不存在，请检查路径。"
        exit 1
    fi

    if [ -d "$frontend_folder" ]; then
        echo "frontend 文件夹存在，正在启动..."
        cd "$frontend_folder"
        npm run dev &
        echo "frontend 已启动。"
    else
        echo "frontend 文件夹不存在，请检查路径。"
        exit 1
    fi
else
    echo "父文件夹 $parent_folder 不存在，请检查路径。"
    exit 1
fi

echo "正在打开浏览器..."
xdg-open "http://192.168.5.253:8080/"  # 替换为你需要的网址