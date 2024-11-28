{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  accelerate,
  datasets,
  rich,
  transformers,
}:

buildPythonPackage rec {
  pname = "trl";
  version = "0.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "huggingface";
    repo = "trl";
    rev = "v${version}";
    hash = "sha256-ml7TBbL4krbyAK6U15+77eiRNoipmxNJARAaclO9RSQ=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    accelerate
    datasets
    rich
    transformers
  ];

  pythonImportsCheck = [
    "trl"
  ];

  meta = {
    description = "Train transformer language models with reinforcement learning";
    homepage = "https://github.com/huggingface/trl";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
