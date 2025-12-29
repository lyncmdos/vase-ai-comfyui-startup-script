#!/bin/bash

# This file will be sourced in init.sh
# Namespace functions with provisioning_

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# 激活虚拟环境
source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    "wget2"
    #"package-2"
)

PIP_PACKAGES=(
    "gguf"
    
)

# --- 【修改点1】这里填入了你需要的所有插件 ---
NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/ltdrdata/was-node-suite-comfyui"
    "https://github.com/felixszeto/ComfyUI-RequestNodes"
    "https://github.com/heshengtao/comfyui_LLM_party"
    "https://github.com/Aaalice233/ComfyUI-Danbooru-Gallery"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
    "https://github.com/SeanScripts/ComfyUI-Unload-Model"
    "https://github.com/Artificial-Sweetener/comfyui-WhiteRabbit"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/ClownsharkBatwing/RES4LYF"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    "https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler"
    "https://github.com/kijai/ComfyUI-Florence2"
    "https://github.com/pollockjj/ComfyUI-MultiGPU"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/giriss/comfy-image-saver"
    "https://github.com/Smirnov75/ComfyUI-mxToolkit"
    "https://github.com/EllangoK/ComfyUI-post-processing-nodes"
    "https://github.com/digitaljohn/comfyui-propost"
    "https://github.com/jamesWalker55/comfyui-various"
    "https://github.com/evanspearman/ComfyMath"
    "https://github.com/JPS-GER/ComfyUI_JPS-Nodes"
    "https://github.com/chrisfreilich/virtuoso-nodes"
    "https://github.com/plugcrypt/CRT-Nodes"
    "https://github.com/edelvarden/comfyui_image_metadata_extension"
    "https://github.com/adieyal/comfyui-dynamicprompts"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
)

WORKFLOWS=(
    
)

# --- 【修改点2】Checkpoint 大模型放这里 ---
CHECKPOINT_MODELS=(
    # 示例 (Z-image-turbo 或者 Flux):
    # "https://civitai.com/api/download/models/798204?type=Model&format=SafeTensor&size=full&fp=fp16"
    # "https://civitai.com/api/download/models/2471283?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    # "https://civitai.com/api/download/models/2388548?type=Model&format=SafeTensor&size=full&fp=fp8"
    #"https://civitai.com/api/download/models/2520801?type=Model&format=GGUF&size=full&fp=fp8"
    #"https://civitai.com/api/download/models/2520805?type=Model&format=GGUF&size=full&fp=fp8"
)

UNET_MODELS=(
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors"
    "https://huggingface.co/T5B/Z-Image-Turbo-FP8/resolve/main/z-image-turbo-fp8-e4m3fn.safetensors"
    #"https://civitai.com/api/download/models/2490517?type=Model&format=SafeTensor&size=pruned&fp=fp8"
)

LORA_MODELS=(
    "https://civitai.com/api/download/models/2471161?type=Model&format=SafeTensor"
)

VAE_MODELS=(
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors"
    #"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
    "https://huggingface.co/Owen777/UltraFlux-v1/resolve/main/vae/diffusion_pytorch_model.safetensors"
)

# 原生支持的 ESRGAN 目录
ESRGAN_MODELS=(
)

# 原生支持的 ControlNet 目录
CONTROLNET_MODELS=(
)

# --- 【修改点3】新增自定义文件夹对应的模型列表 ---
# 填入 text_encoders 模型链接
TEXT_ENCODER_MODELS=(
    "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors"
    #"https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
    # "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"
)

# 填入 upscale_models 模型链接 (有些放在 esrgan 里，有些放在这)
UPSCALE_MODELS=(
    "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
)

# 填入 LLM 模型链接
LLM_MODELS=(
    "https://huggingface.co/Qwen/Qwen3-8B-GGUF/resolve/main/Qwen3-8B-Q8_0.gguf"
    #"https://huggingface.co/DavidAU/Qwen3-8B-Hivemind-Instruct-Heretic-Abliterated-Uncensored-NEO-Imatrix-GGUF/resolve/main/Qwen3-8B-Hivemind-Inst-Hrtic-Ablit-Uncensored-Q8_0.gguf"
    #"https://huggingface.co/unsloth/Qwen3-4B-GGUF/resolve/main/Qwen3-4B-Q8_0.gguf?download=true"
    "https://huggingface.co/Qwen/Qwen3-VL-8B-Instruct-GGUF/resolve/main/Qwen3VL-8B-Instruct-Q8_0.gguf"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    # 1. 安装基础工具
    echo "Installing wget2 and uv for maximum speed..."
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get install -y wget2 > /dev/null 2>&1
    
    # 2. 安装 uv
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source $HOME/.cargo/env
    source $HOME/.local/bin/env

    # 3. 【关键新增】立刻安装 huggingface_hub 以启用 CLI
    # 使用 --system 安装到系统环境，确保全局可用
    printf "🚀 Installing Hugging Face CLI...\n"
    uv pip install --system huggingface_hub[cli]
    
    provisioning_print_header

    # [线程1] 处理插件
    (
        provisioning_setup_nodes_and_pip
    ) &
    local pid_nodes_pip=$!

    # [线程2] 处理模型
    (
        provisioning_download_all_models
    ) &
    local pid_models=$!

    wait $pid_nodes_pip
    wait $pid_models
    
    provisioning_print_end
}

# 辅助函数: 集中处理所有模型下载任务
function provisioning_download_all_models() {
    echo "🚀 启动全目录并行下载模式..."

    # 每个目录都加上 &，让它们在后台并行跑
    provisioning_get_files "${COMFYUI_DIR}/models/checkpoints" "${CHECKPOINT_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/unet" "${UNET_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/loras" "${LORA_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/controlnet" "${CONTROLNET_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/vae" "${VAE_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/esrgan" "${ESRGAN_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/text_encoders" "${TEXT_ENCODER_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/upscale_models" "${UPSCALE_MODELS[@]}" &
    provisioning_get_files "${COMFYUI_DIR}/models/LLM" "${LLM_MODELS[@]}" &

    # 关键：等待所有后台目录下载任务完成
    wait
    echo "✨ 所有模型目录同步完成！"
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}
 
function provisioning_setup_nodes_and_pip() {
    local req_files=()
    local node_paths=()
    #export CMAKE_ARGS="-DLLAMA_CUDA=on"
    #export FORCE_CMAKE=1
    printf "开始并行处理插件克隆...\n"

    # 1. 并行克隆/更新插件
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        node_paths+=("$path")
        
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                ( cd "$path" && git pull ) & 
            fi
        else
            git clone "${repo}" "${path}" --recursive &
        fi
        
        # 限制 Git 并发数
        if [[ $(jobs -r | wc -l) -ge 64 ]]; then wait -n; fi
    done
    wait

    printf "插件下载完成，正在整理依赖列表...\n"

    # 2. 收集所有 requirements.txt
    for path in "${node_paths[@]}"; do
        requirements="${path}/requirements.txt"
        if [[ -e $requirements ]]; then
            req_files+=("-r" "$requirements")
        fi
    done

    # 3. 使用 uv 安装（去掉 --prefer-binary，改用更兼容的写法）
    if [[ ${#req_files[@]} -gt 0 || ${#PIP_PACKAGES[@]} -gt 0 ]]; then
        printf "🚀 使用 UV 极速安装所有依赖...\n"
        
        # --system: 安装到当前 Python 环境
        # --no-build: (可选) 如果你绝对不想等待编译，可以加这个。但建议不加，以防某些节点安装失败。
        # uv 会自动并行下载下载所有包，比 pip 快得多。
        uv pip install --system "${PIP_PACKAGES[@]}" "${req_files[@]}"
    fi
    printf "🚀 正在安装预编译的 CUDA 版 llama-cpp-python (免编译)...\n"
    
    # 注意：这里假设你的环境是 CUDA 12.x (cu121/cu122/cu123 通用)
    # 如果你的环境是很老的 CUDA 11.8，把下面的 cu121 改成 cu118
    uv pip install --system llama-cpp-python \
        --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cu124
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    local dir="$1"
    shift
    local arr=("$@")
    
    [[ ${#arr[@]} -eq 0 ]] && return 0

    mkdir -p "$dir"
    printf "📂 目录并发开启: %s (%s 个文件)\n" "$dir" "${#arr[@]}"
    
    # 内部仍然保持一定的并发，但因为外部已经并行了，这里可以设小一点
    local max_internal_jobs=4
    local count=0

    for url in "${arr[@]}"; do
        [[ $url =~ ^# ]] && continue
        
        provisioning_download "${url}" "${dir}" &
        
        ((count++))
        if (( count >= max_internal_jobs )); then
            wait -n
            ((count--))
        fi
    done
    wait
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

# Download from $1 URL to $2 file path
# Download from $1 URL to $2 file path
function provisioning_download() {
    local url="$1"
    local dir="$2"
    local auth_token=""

    # 1. 清理 URL 中的参数 (例如 ?download=true)，防止干扰解析
    local clean_url="${url%%\?*}"

    [[ -n $HF_TOKEN && $url =~ huggingface\.co ]] && auth_token="$HF_TOKEN"
    [[ -n $CIVITAI_TOKEN && $url =~ civitai\.com ]] && auth_token="$CIVITAI_TOKEN"

    local filename=$(basename "$clean_url")

    # 2. 判断是否为 HuggingFace 链接
    if [[ $clean_url =~ huggingface\.co ]]; then
        # 正则表达式：提取 Repo 和 文件路径
        # 匹配格式: huggingface.co/ USER / REPO / (resolve|blob) / BRANCH / PATH...
        if [[ $clean_url =~ huggingface\.co/([^/]+/[^/]+)/(resolve|blob)/([^/]+)/(.+) ]]; then
            local repo_id="${BASH_REMATCH[1]}"
            local branch="${BASH_REMATCH[3]}" # 通常是 main，但也可能是其他分支
            local file_path="${BASH_REMATCH[4]}"
            
            printf "⚡ [HF-CLI] Detecting: %s -> %s\n" "$repo_id" "$file_path"
            
            # 使用 huggingface-cli 下载
            # --local-dir-use-symlinks False: 确保下载的是实体文件而不是缓存链接，方便移动
            huggingface-cli download "$repo_id" "$file_path" \
                --revision "$branch" \
                --local-dir "$dir" \
                --local-dir-use-symlinks False \
                --quiet # 减少日志刷屏，想看进度可以去掉这行
            
            if [ $? -eq 0 ]; then
                printf " ✅ [HF-CLI OK] %s\n" "$file_path"
                return 0
            else
                printf " ⚠️ [HF-CLI FAIL] 尝试回退到 wget2: %s\n" "$filename"
                # 如果 CLI 失败（比如版本不兼容），代码会自动往下走，用 wget2 兜底
            fi
        fi
    fi

    # 3. 非 HF 链接，或 HF 下载失败，回退到 wget2 / wget
    local wget2_args="--max-threads=8 --progress=none --no-clobber --content-disposition"
    
    # 构建 Auth Header
    local header_args=""
    if [[ -n $auth_token ]]; then
        header_args="--header=\"Authorization: Bearer $auth_token\""
    fi
    
    if command -v wget2 &> /dev/null; then
        # 注意：在 bash -c 中正确传递带引号的 header 比较麻烦，这里用 eval 或者直接 cd 运行
        ( cd "$dir" && eval wget2 $header_args $wget2_args "\"$url\"" )
    else
        wget -q -nc --content-disposition --header="Authorization: Bearer $auth_token" -P "$dir" "$url"
    fi

    [ $? -eq 0 ] && printf " ✅ [WGET OK] %s\n" "$filename" || printf " ❌ [FAIL] %s\n" "$filename"
}

if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi