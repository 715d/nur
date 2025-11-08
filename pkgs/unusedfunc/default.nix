{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "unusedfunc";
  version = "0.0.1-dev";

  src = fetchFromGitHub {
    owner = "715d";
    repo = "unusedfunc";
    rev = "987082793185ba6246d8fbc68076565a64c40423";
    hash = "sha256-pjujLrLV6HKNTausk+f6pm22qcFfjU+InbwFwPZbxFo=";
  };

  vendorHash = "sha256-gNBMLs++uN6VR5yjXnLJ1godLpU8Aa7rM2gBZhVS9Vw=";

  ldflags = [
    "-X main.version=${version}"
    "-X main.buildTime=1970-01-01_00:00:00"
    "-X main.gitCommit=${src.rev}"
    "-w"
    "-s"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Go linter detecting unused functions with /internal awareness";
    homepage = "https://github.com/715d/unusedfunc";
    license = licenses.bsd3;
    maintainers = [ ];
    mainProgram = "unusedfunc";
  };
}
