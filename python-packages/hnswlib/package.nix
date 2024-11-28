{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  pybind11,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "hnswlib";
  version = "0.7.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chroma-core";
    repo = "hnswlib";
    rev = version;
    hash = "sha256-pjz5SGg2drO6fkml9ojFG7/Gq3/Y7vPaOHc+3LKnjUw=";
  };

  build-system = [
    numpy
    pybind11
    setuptools
    wheel
  ];

  pythonImportsCheck = [
    "hnswlib"
  ];

  meta = {
    description = "Chroma's fork of hnswlib - a header-only C++/python library for fast approximate nearest neighbors";
    homepage = "https://github.com/chroma-core/hnswlib";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
