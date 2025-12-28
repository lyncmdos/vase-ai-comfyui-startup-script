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
    "llama-cpp-python"
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
    "https://huggingface.co/DavidAU/Qwen3-8B-Hivemind-Instruct-Heretic-Abliterated-Uncensored-NEO-Imatrix-GGUF/resolve/main/Qwen3-8B-Hivemind-Inst-Hrtic-Ablit-Uncensored-Q8_0.gguf"
    "https://huggingface.co/unsloth/Qwen3-4B-GGUF/resolve/main/Qwen3-4B-Q8_0.gguf?download=true"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    # 1. 基础环境（建议保持串行，因为它们通常是后续操作的依赖）
    echo "Updating package list and installing wget2..."
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get install -y wget2 > /dev/null 2>&1
    provisioning_get_apt_packages
    
    provisioning_print_header

    echo "--------------------------------------------------------"
    echo " 🚀 启动全并行模式: [1.插件+依赖] & [2.模型下载] 同时进行"
    echo "--------------------------------------------------------"

    # [线程1] 处理插件克隆及所有 PIP 依赖安装
    (
        provisioning_setup_nodes_and_pip
    ) &
    local pid_nodes_pip=$!

    # [线程2] 处理所有模型下载
    (
        provisioning_download_all_models
    ) &
    local pid_models=$!

    # 同时等待两个大流完成
    wait $pid_nodes_pip
    wait $pid_models
    
    provisioning_print_end
}

# 辅助函数: 集中处理所有模型下载任务
function provisioning_download_all_models() {
    # 下载各目录模型
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
        
    # 下载自定义目录模型
    provisioning_get_files \
        "${COMFYUI_DIR}/models/text_encoders" \
        "${TEXT_ENCODER_MODELS[@]}"
        
    provisioning_get_files \
        "${COMFYUI_DIR}/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
        
    provisioning_get_files \
        "${COMFYUI_DIR}/models/LLM" \
        "${LLM_MODELS[@]}"
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_setup_nodes_and_pip() {
    local req_files=()
    local node_paths=()
    export CMAKE_ARGS="-DLLAMA_CUDA=on"
    export FORCE_CMAKE=1
    printf "开始并行处理插件克隆...\n"

    # 并行克隆所有节点
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
        
        # 限制 Git 并发
        if [[ $(jobs -r | wc -l) -ge 64 ]]; then wait -n; fi
    done
    wait

    printf "插件已就绪，开始合并安装所有 PIP 依赖...\n"

    # 收集插件的 requirements.txt
    for path in "${node_paths[@]}"; do
        requirements="${path}/requirements.txt"
        if [[ -e $requirements ]]; then
            req_files+=("-r" "$requirements")
        fi
    done

    # 合并全局 PIP_PACKAGES 和 插件依赖，一次性安装（效率最高）
    if [[ ${#req_files[@]} -gt 0 || ${#PIP_PACKAGES[@]} -gt 0 ]]; then
        pip install --no-cache-dir "${PIP_PACKAGES[@]}" "${req_files[@]}"
    fi
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    
    # 如果数组为空，直接返回，避免打印空日志
    if [[ ${#arr[@]} -eq 0 ]]; then return 0; fi

    echo "--------------------------------------------------------"
    printf "准备下载 %s 个模型到目录: %s\n" "${#arr[@]}" "$dir"
    
    local max_jobs=5
    local count=0

    for url in "${arr[@]}"; do
        # 排除注释行
        if [[ $url =~ ^# ]]; then continue; fi
        
        # 后台启动 wget 下载
        provisioning_download "${url}" "${dir}" &
        
        # 计数器控制并发
        ((count++))
        if (( count >= max_jobs )); then
            # 等待任一后台任务完成，保持并发池稳定
            wait -n
            ((count--))
        fi
    done

    # 等待当前目录所有下载任务完成
    wait
    printf "✅ 目录下载完成: %s\n\n" "$dir"
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

    [[ -n $HF_TOKEN && $url =~ huggingface\.co ]] && auth_token="$HF_TOKEN"
    [[ -n $CIVITAI_TOKEN && $url =~ civitai\.com ]] && auth_token="$CIVITAI_TOKEN"

    local short_url=$(echo "$url" | cut -d'?' -f1 | awk -F/ '{print $NF}')
    mkdir -p "$dir"

    # 使用 wget2 开启 8 线程
    local wget2_args="--max-threads=8 --progress=none --no-clobber --content-disposition"
    
    if [[ -n $auth_token ]]; then
        if command -v wget2 &> /dev/null; then
            ( cd "$dir" && wget2 --header="Authorization: Bearer $auth_token" $wget2_args "$url" )
        else
            wget --header="Authorization: Bearer $auth_token" -q -nc --content-disposition -P "$dir" "$url"
        fi
    else
        if command -v wget2 &> /dev/null; then
             ( cd "$dir" && wget2 $wget2_args "$url" )
        else
             wget -q -nc --content-disposition -P "$dir" "$url"
        fi
    fi
    
    [ $? -eq 0 ] && printf " ✅ [OK] %s\n" "$short_url" || printf " ❌ [FAIL] %s\n" "$short_url"
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi