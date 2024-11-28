{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cargo,
  pkg-config,
  protobuf,
  rustPlatform,
  rustc,
  chroma, # The rust package
  setuptools,
  setuptools-scm,
  bzip2,
  openssl,
  rust-jemalloc-sys,
  zstd,
  stdenv,
  darwin,
  bcrypt,
  build,
  chroma-hnswlib,
  fastapi,
  graphlib-backport,
  grpcio,
  httpx,
  importlib-resources,
  kubernetes,
  mmh3,
  numpy,
  onnxruntime,
  opentelemetry-api,
  opentelemetry-exporter-otlp-proto-grpc,
  opentelemetry-instrumentation-fastapi,
  opentelemetry-sdk,
  orjson,
  overrides,
  posthog,
  pydantic,
  pypika,
  pyyaml,
  rich,
  tenacity,
  tokenizers,
  tqdm,
  typer,
  typing-extensions,
  uvicorn,
}:

buildPythonPackage {
  pname = "chromadb";
  inherit (chroma) version;
  pyproject = true;

  inherit (chroma) src;

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit (chroma) src;
    name = "${chroma.pname}-${chroma.version}";
    hash = chroma.cargoHash;
  };

  build-system = [
    cargo
    pkg-config
    protobuf
    rustPlatform.cargoSetupHook
    rustc
    setuptools
    setuptools-scm
  ];

  buildInputs =
    [
      bzip2
      openssl
      rust-jemalloc-sys
      zstd
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
    ];

  dependencies = [
    bcrypt
    build
    chroma-hnswlib
    fastapi
    graphlib-backport
    grpcio
    httpx
    importlib-resources
    kubernetes
    mmh3
    numpy
    onnxruntime
    opentelemetry-api
    opentelemetry-exporter-otlp-proto-grpc
    opentelemetry-instrumentation-fastapi
    opentelemetry-sdk
    orjson
    overrides
    posthog
    pydantic
    pypika
    pyyaml
    rich
    tenacity
    tokenizers
    tqdm
    typer
    typing-extensions
    uvicorn
  ];

  pythonImportsCheck = [
    "chromadb"
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = {
    description = "The AI-native open-source embedding database";
    homepage = "https://github.com/chroma-core/chroma/";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
  };
}
