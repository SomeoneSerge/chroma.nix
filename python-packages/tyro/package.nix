{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  backports-cached-property,
  colorama,
  docstring-parser,
  eval-type-backport,
  rich,
  shtab,
  typeguard,
  typing-extensions,
  attrs,
  coverage,
  flax,
  frozendict,
  mypy,
  numpy,
  omegaconf,
  pydantic,
  pyright,
  pytest,
  pytest-cov,
  pyyaml,
  ruff,
  torch,
}:

buildPythonPackage rec {
  pname = "tyro";
  version = "0.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "brentyi";
    repo = "tyro";
    rev = "v${version}";
    hash = "sha256-jFsZ112N/oAoa4dgOcS2cv0U4BPCepsnRpfIER+Hbuc=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    backports-cached-property
    colorama
    docstring-parser
    eval-type-backport
    rich
    shtab
    typeguard
    typing-extensions
  ];

  optional-dependencies = {
    dev = [
      attrs
      coverage
      eval-type-backport
      flax
      frozendict
      mypy
      numpy
      omegaconf
      pydantic
      pyright
      pytest
      pytest-cov
      pyyaml
      ruff
      torch
    ];
  };

  pythonImportsCheck = [
    "tyro"
  ];

  meta = {
    description = "CLI interfaces & config objects, from types";
    homepage = "https://github.com/brentyi/tyro";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
  };
}
