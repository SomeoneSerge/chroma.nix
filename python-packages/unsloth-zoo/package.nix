{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  accelerate,
  cut-cross-entropy,
  datasets,
  hf-transfer,
  huggingface-hub,
  numpy,
  packaging,
  peft,
  pillow,
  protobuf,
  psutil,
  sentencepiece,
  torch,
  tqdm,
  transformers,
  triton,
  trl,
  tyro,
  wheel,
}:

buildPythonPackage rec {
  pname = "unsloth-zoo";
  version = "unstable-2024-11-26";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "unslothai";
    repo = "unsloth-zoo";
    rev = "f889b058c00fb06dac60a2c51d24ca441e505f3c";
    hash = "sha256-Sy/TTafwPPn2SB6G04ioRtHteY9vxNqu+KH4auoF/78=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    accelerate
    cut-cross-entropy
    datasets
    hf-transfer
    huggingface-hub
    numpy
    packaging
    peft
    pillow
    protobuf
    psutil
    sentencepiece
    torch
    tqdm
    transformers
    triton
    trl
    tyro
    wheel
  ];

  pythonImportsCheck = [
    "unsloth_zoo"
  ];

  meta = {
    description = "Utils for Unsloth";
    homepage = "https://github.com/unslothai/unsloth-zoo/";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ ];
  };
}
