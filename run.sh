#!/bin/bash

# 定义 model_adaptation_methods、intern_domains 和 seeds
model_adaptation_methods=("cotta" "tent" "sar" "bn_adapt" "eata")
intern_domains=("HomogeneousNoMixture" "CrossMixture")
data_names=("imagenet_c_deterministic-gaussian_noise-5" "imagenet_c_deterministic-shot_noise-5" "imagenet_c_deterministic-impulse_noise-5" "imagenet_c_deterministic-defocus_blur-5" "imagenet_c_deterministic-glass_blur-5" "imagenet_c_deterministic-motion_blur-5" "imagenet_c_deterministic-zoom_blur-5" "imagenet_c_deterministic-snow-5" "imagenet_c_deterministic-frost-5" "imagenet_c_deterministic-fog-5" "imagenet_c_deterministic-brightness-5" "imagenet_c_deterministic-contrast-5" "imagenet_c_deterministic-elastic_transform-5" "imagenet_c_deterministic-pixelate-5" "imagenet_c_deterministic-jpeg_compression-5")
seeds=(2022 2023 2024)

# 循环遍历每一个 model_adaptation_method
for data_name in "${data_names[@]}"; do
	for model_adaptation_method in "${model_adaptation_methods[@]}"; do
		# 循环遍历每一个 intern_domain
		for intern_domain in "${intern_domains[@]}"; do
			# 循环遍历每一个 seed
			for seed in "${seeds[@]}"; do
				# 构建 root_path
				root_path="./single_domain/${data_name}/${model_adaptation_method}_${intern_domain}_${seed}"

				# 运行 Python 程序
				python run_exp.py --model_adaptation_method $model_adaptation_method --inter_domain $intern_domain --root_path $root_path --seed $seed --data_names $data_name
			done
		done
	done
done
