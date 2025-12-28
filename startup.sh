#!/bin/bash

# This file will be sourced in init.sh
# Namespace functions with provisioning_

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# 激活虚拟环境
source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
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
    https://civitai.com/api/download/models/2471161?type=Model&format=SafeTensor
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
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    # 【加速模块】自动安装 aria2 以实现多线程下载
    echo "Updating package list and installing aria2 for faster downloads..."
    sudo apt-get update > /dev/null 2>&1
    sudo apt-get install -y aria2 > /dev/null 2>&1
    
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    
    # 下载各目录模型
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
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
        
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    
    # 【智能加速逻辑】
    # 如果系统里有 aria2，并且是 HuggingFace 的直链（以文件扩展名结尾），则使用多线程
    # Civitai 链接通常没有扩展名，aria2 处理文件名比较麻烦，所以 Civitai 还是用 wget 此时最稳
    if command -v aria2c >/dev/null 2>&1 && [[ "$1" == *.* ]]; then
        if [[ -n $auth_token ]];then
            aria2c --header="Authorization: Bearer $auth_token" -x 16 -s 16 -k 1M -c -d "$2" "$1"
        else
            aria2c -x 16 -s 16 -k 1M -c -d "$2" "$1"
        fi
    else
        # 降级回退到 wget (针对 Civitai API 或 aria2 安装失败的情况)
        if [[ -n $auth_token ]];then
            wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
        else
            wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
        fi
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi