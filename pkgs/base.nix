{ pkgs, ... }:

with import ../util;

let

  node2nixPkgs = import ./node2nix {};

in

with pkgs;
  
lib.flatten (builtins.attrValues {

  aliases = mkAliases {
    #elm-format = "${elmPackages.elm}/bin/elm-format-0.18";
    greyBg = "xsetroot -solid '#c5c8c9'";
    blackBg = "xsetroot -solid '#000000'";
  };

  custom = [
    notify-play
  ];

  desktop = [
    xmonad
  ];

  web = [
    tdesktop
    chromium
    firefox
    tor
    thunderbird
    torbrowser
    youtube-dl
  ];
  
  dev = [
    emacs
    emacs-client
    mysql
    cabal-install
    vim
    gcc
#   racket
    python
    zeal
    stack
    openjdk
    leiningen
    git
    pkgs.boot
    ghc
    node2nixPkgs.elm-oracle
    node2nixPkgs.cross-env
#   node2nixPkgs.create-elm-app
    node2nixPkgs.pulp
    node2nixPkgs.selenium-webdriver
    node2nixPkgs.ts-node
    nodePackages.prettier
    nodePackages.bower
    nodePackages.typescript
    #haskellPackages.idris
    yarn
    chromedriver
    gitAndTools.gitflow
    nodejs-8_x
    elmPackages.elm
    #purescript
  ];
  
  gfx = [
    blender
    imagemagick
    gimp
    graphviz
  ];
  
  nix = [
    nixops
    npm2nix
    nix-prefetch-git
    #cabal2nix
    nodePackages.node2nix
  ];
  
  system = [
    acpi
  ];
  
  cli = [
    rxvt
    fish
    bash
    coreutils
    tree
    which
    jp
    pstree
    bc
    file
    rlwrap
    inotify-tools
    libnotify
    parallel
  ];
  
  utils = [
    zip
    unzip
    pass
  ];
  
  media = [
    vlc
    scrot
    feh
    espeak
    sox
  ];
  
  office = [
    #libreoffice
    aspellDicts.de
    aspellDicts.en
    aspell
  ];
  
  crypto = [
    gnupg
  ];
  
  vm = [
    virtualbox
  ];

})
