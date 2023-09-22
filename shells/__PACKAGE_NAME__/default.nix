{
  gnumake,
  mkShell,
  stdenv,
  zlib,
  python3,
  python3Packages,
}:
#
# Create a development shell using three sections:
# `packages`, `buildInputs`, and `shellHook`.
#
mkShell {
  # Compilers and libraries go here
  buildInputs = [
    stdenv.cc
    zlib
    python3
    python3Packages.pip
    python3Packages.dagster-dbt
    python3Packages.dagster-webserver
    python3Packages.dbt-duckdb
  ];

  # Add extra tools here
  packages = [
    gnumake
  ];

  # Any variable set in this block that isn't a reserved word will be set as an
  # environment variable in the environment.
  WELCOME_MESSAGE = "Welcome to Analytics Engineering workspace";

  # A shell hook is a script to run when entering an environment.
  # It can be used to perform any custom activation steps needed for your
  # project.
  shellHook = ''
    echo
    echo "$WELCOME_MESSAGE"
  '';
}
