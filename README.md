# ezrknn-toolkit2
This repo tries to make RKNN Toolkit 2 install easier and more organised. RKNN Toolkit is the software used for testing and using the NPU inside Rockchip's chips like the RK3588 found in the Orange Pi 5 and Radxa Rock 5.
This repo installs easily the utilities for running AI with the NPU on the boards, it does not install the Android utilities, simulator, server... 

## Requirements
Keep in mind this repo is focused for:
- Only installing what's needed for Linux and running on the SBCs, not the simulator, server and other tools.
- ARM64 devices, focusing mainly on RK3588, but it should work on other RK SoCs.
- You are running either Debian 11 or Ubuntu 22.04 or later versions. Derivatives should possibly work fine too.
- Possibly will work better on not heavily modified OS installations (i.e. not using an older Python version or too recent)
- Unrelated, but could be useful for other AI applications: https://www.roselladb.com/install-opencl-orangepi5-debian-ubuntu.htm

## Quick Install
Run:

```bash
curl https://raw.githubusercontent.com/Pelochus/ezrknn-toolkit2/master/quick-install.sh | sudo bash
```

## Test
Run (cd is required):

```bash
cd rknn-toolkit-lite2/examples/resnet18
python3 test.py
```

It should output this:

```
--> Load RKNN model
done
--> Init runtime environment
I RKNN: [21:37:24.622] RKNN Runtime Information, librknnrt version: 2.0.0b0 (35a6907d79@2024-03-24T10:31:14)
I RKNN: [21:37:24.622] RKNN Driver Information, version: 0.9.5
I RKNN: [21:37:24.623] RKNN Model Information, version: 6, toolkit version: 2.0.0b0+9bab5682(compiler version: 2.0.0b0 (35a6907d79@2024-03-24T02:34:11)), target: RKNPU v2, target platform: rk3588, framework name: PyTorch, framework layout: NCHW, model inference type: static_shape
done
--> Running model
resnet18
-----TOP 5-----
[812] score:0.999680 class:"space shuttle"
[404] score:0.000249 class:"airliner"
[657] score:0.000013 class:"missile"
[466] score:0.000009 class:"bullet train, bullet"
[895] score:0.000008 class:"warplane, military plane"

done
```

This doesn't use the NPU. Check this issue to actually test NPU usage: https://github.com/Pelochus/ezrknn-toolkit2/issues/2

## References
- Dedicated subreddit: https://www.reddit.com/r/RockchipNPU/
- Lots of info here, but not very well organised: https://github.com/airockchip/rknn-toolkit2/tree/master
- Example of CV and developing. I extracted some commands for installing: https://github.com/Qengineering/YoloV5-NPU-Rock-5
- This link explains the main capabilities of RKNN Toolkit 2: https://wiki.t-firefly.com/en/ROC-RK3588S-PC/usage_npu.html#rknn-toolkit2
- Some basic but well explained info for Radxa devices: https://docs.radxa.com/en/rock5/rock5b/low-level-dev/rknn-toolkit2

## TODO
- Make new repo structure:
  - New repo which contain 2 submodules: this repo and rk-llm
  - If so, simplify this repo (documentation, just one script and the rest shall only be minor modifications (like the CMakeLists.txt one in rknn-bench)

# Original README starts below

<hr>
<hr>
<hr>

# Description
  RKNN software stack can help users to quickly deploy AI models to Rockchip chips. The overall framework is as follows:
    <center class="half">
        <div style="background-color:#ffffff;">
        <img src="res/framework.png" title="RKNN"/>
    </center>

  In order to use RKNPU, users need to first run the RKNN-Toolkit2 tool on the computer, convert the trained model into an RKNN format model, and then inference on the development board using the RKNN C API or Python API.

- RKNN-Toolkit2 is a software development kit for users to perform model conversion, inference and performance evaluation on PC and Rockchip NPU platforms.

- RKNN-Toolkit-Lite2 provides Python programming interfaces for Rockchip NPU platform to help users deploy RKNN models and accelerate the implementation of AI applications.

- RKNN Runtime provides C/C++ programming interfaces for Rockchip NPU platform to help users deploy RKNN models and accelerate the implementation of AI applications.

- RKNPU kernel driver is responsible for interacting with NPU hardware. It has been open source and can be found in the Rockchip kernel code.

# Support Platform
  - RK3566/RK3568 Series
  - RK3588 Series
  - RK3576 Series
  - RK3562 Series
  - RV1103/RV1106
  - RK2118

Note:

​      **For RK1808/RV1109/RV1126/RK3399Pro, please refer to :**

​          https://github.com/airockchip/rknn-toolkit

​          https://github.com/airockchip/rknpu

​          https://github.com/airockchip/RK3399Pro_npu


# Download
- You can also download all packages, docker image, examples, docs and platform-tools from [RKNPU2_SDK](https://console.zbox.filez.com/l/I00fc3), fetch code: rknn
- You can get more examples from [rknn mode zoo](https://github.com/airockchip/rknn_model_zoo)

# Notes
- RKNN-Toolkit2 is not compatible with [RKNN-Toolkit](https://github.com/airockchip/rknn-toolkit)
- Currently only support on:
  - Ubuntu 18.04 python 3.6/3.7
  - Ubuntu 20.04 python 3.8/3.9
  - Ubuntu 22.04 python 3.10/3.11
- Latest version:v2.0.0-beta0

# RKNN LLM

If you want to deploy LLM (Large Language Model), we have introduced a new SDK called RKNN-LLM. For details, please refer to:

https://github.com/airockchip/rknn-llm

# CHANGELOG

## v2.0.0-beta0
 - Support RK3576 (Beta)
 - Support RK2118 (Beta)
 - Support SDPA (Scaled Dot Product Attention) to improve transformer performance
 - Improve custom operators support
 - Improve MatMul API
 - Improve support for Reshape,Transpose,BatchLayernorm,Softmax,Deconv,Matmul,ScatterND etc.
 - Support pytorch 2.1
 - Improve support for QAT models of pytorch and onnx
 - Optimize automatic generation of C++ code

 for older version, please refer [CHANGELOG](CHANGELOG.md)

# Feedback and Community Support
- [Redmine](https://redmine.rock-chips.com) (**Feedback recommended, Please consult our sales or FAE for the redmine account**)
- QQ Group Chat: 1025468710 (full, please join group 3)
- QQ Group Chat2: 547021958 (full, please join group 3)
- QQ Group Chat3: 469385426
<center class="half">
  <img width="200" height="200"  src="res/QQGroupQRCode.png" title="QQ Group Chat"/>
  <img width="200" height="200"  src="res/QQGroup2QRCode.png" title="QQ Group Chat2"/>
  <img width="200" height="200"  src="res/QQGroup3QRCode.png" title="QQ Group Chat3"/>
</center>
