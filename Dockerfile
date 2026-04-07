# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The following custom nodes are listed in the workflow under unknown_registry but have no aux_id (GitHub repo) so they could not be resolved automatically and are skipped:
# - CheckpointLoaderSimple
# - LoadPromptsFromFile //Inspire
# - UnzipPrompt //Inspire

# download models into comfyui
RUN comfy model download --url https://huggingface.co/xxiaogui/hongchao/blob/main/juggernautXL_ragnarokBy.safetensors --relative-path models/checkpoints --filename juggernautXL_ragnarokBy.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
