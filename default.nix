let
{ pkgs ? pinnedPkgs }:
  pkgs = import <nixpkgs> {};
in buildEnv {
  name = "mogrias-dotfiles-env";
  src = "./";
  nativeBuildInputs = with pkgs; [
    # dependencies

    wget
    git
    openssh
    stow
    util-linux
    man
    make
    gawk
    clang

  ];
}
