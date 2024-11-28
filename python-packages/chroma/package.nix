{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  nativeProtobuf ? pkgs.protobuf,
  bzip2,
  openssl,
  rust-jemalloc-sys,
  pkgs,
  nativeZstd ? pkgs.zstd,
  stdenv,
  darwin,
  hnswlib,
}:

rustPlatform.buildRustPackage rec {
  pname = "chroma";
  version = "0.5.20";

  src = fetchFromGitHub {
    owner = "chroma-core";
    repo = "chroma";
    rev = version;
    hash = "sha256-DQHkgCHtrn9xi7Kp7TZ5NP1EtFtTH5QOvne9PUvxsWc=";
  };

  postPatch = ''
    ln -s ${hnswlib.src} ../hnswlib
  '';

  cargoHash = "sha256-YAG9Oj98hm+OrgiIJTX1u/aoKHE23SiEFyl7mJT6b3Y=";

  nativeBuildInputs = [
    pkg-config
    nativeProtobuf
  ];

  buildInputs = [
    bzip2
    openssl
    rust-jemalloc-sys
    nativeZstd
    hnswlib
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  checkFlags = [
    "--skip=admissioncontrolleds3::tests::test_k8s_integration_empty_file"
    "--skip=admissioncontrolleds3::tests::test_k8s_integration_multipart_get"
    "--skip=admissioncontrolleds3::tests::test_k8s_integration_put_get_key"
    "--skip=s3::tests::test_k8s_integration_empty_file"
    "--skip=s3::tests::test_k8s_integration_multipart_get"
    "--skip=s3::tests::test_k8s_integration_put_file_scenarios"
    "--skip=s3::tests::test_k8s_integration_put_get_key"
    "--skip=memberlist::memberlist_provider::tests::test_k8s_integration_it_can_work"
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = {
    description = "The AI-native open-source embedding database";
    homepage = "https://github.com/chroma-core/chroma";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "chroma";
  };
}
