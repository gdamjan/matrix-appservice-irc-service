{ pkgs, matrix-appservice-irc }:

let
  matrix-appservice-irc-service = pkgs.substituteAll {
    name = "matrix-appservice-irc.service";
    src = ./files/matrix-appservice-irc.service.in;
    execBin = "${matrix-appservice-irc}/bin/matrix-appservice-irc";
  };
in

pkgs.portableService {
  pname = "matrix-appservice-irc";
  version = matrix-appservice-irc.version;
  description = ''Portable "matrix-appservice-irc" service built with Nix'';
  homepage = "https://github.com/gdamjan/matrix-appservice-irc-service/";

  units = [
    matrix-appservice-irc-service
  ];

  symlinks = [
    { object = "${pkgs.cacert}/etc/ssl"; symlink = "/etc/ssl"; }
    { object = "${pkgs.bash}/bin/bash"; symlink = "/bin/sh"; }
  ];
}
