{
  pkgs = hackage:
    {
      packages = {
        "pretty".revision = (((hackage."pretty")."1.1.3.6").revisions).default;
        "array".revision = (((hackage."array")."0.5.4.0").revisions).default;
        "network".revision = (((hackage."network")."2.8.0.1").revisions).default;
        "mtl".revision = (((hackage."mtl")."2.2.2").revisions).default;
        "bytestring".revision = (((hackage."bytestring")."0.10.12.1").revisions).default;
        "filepath".revision = (((hackage."filepath")."1.4.2.1").revisions).default;
        "stm".revision = (((hackage."stm")."2.5.0.0").revisions).default;
        "ghc-heap".revision = (((hackage."ghc-heap")."9.0.1").revisions).default;
        "ghc-prim".revision = (((hackage."ghc-prim")."0.7.0").revisions).default;
        "ghc-boot-th".revision = (((hackage."ghc-boot-th")."9.0.1").revisions).default;
        "base".revision = (((hackage."base")."4.15.0.0").revisions).default;
        "time".revision = (((hackage."time")."1.11.1.2").revisions).default;
        "Win32".revision = (((hackage."Win32")."2.8.3.0").revisions).default;
        "process".revision = (((hackage."process")."1.6.13.2").revisions).default;
        "hsc2hs".revision = (((hackage."hsc2hs")."0.68.8").revisions).default;
        "hsc2hs".flags.in-ghc-tree = false;
        "ghc-bignum".revision = (((hackage."ghc-bignum")."1.0").revisions).default;
        "directory".revision = (((hackage."directory")."1.3.7.0").revisions).default;
        "exceptions".revision = (((hackage."exceptions")."0.10.4").revisions).default;
        "rts".revision = (((hackage."rts")."1.0").revisions).default;
        "transformers".revision = (((hackage."transformers")."0.5.6.2").revisions).default;
        "template-haskell".revision = (((hackage."template-haskell")."2.17.0.0").revisions).default;
        "deepseq".revision = (((hackage."deepseq")."1.4.5.0").revisions).default;
        "binary".revision = (((hackage."binary")."0.8.8.0").revisions).default;
        "containers".revision = (((hackage."containers")."0.6.4.1").revisions).default;
        };
      compiler = {
        version = "9.0.1";
        nix-name = "ghc901";
        packages = {
          "pretty" = "1.1.3.6";
          "array" = "0.5.4.0";
          "mtl" = "2.2.2";
          "bytestring" = "0.10.12.1";
          "filepath" = "1.4.2.1";
          "stm" = "2.5.0.0";
          "ghc-heap" = "9.0.1";
          "ghc-prim" = "0.7.0";
          "ghc-boot-th" = "9.0.1";
          "base" = "4.15.0.0";
          "ghc-bignum" = "1.0";
          "exceptions" = "0.10.4";
          "rts" = "1.0";
          "transformers" = "0.5.6.2";
          "template-haskell" = "2.17.0.0";
          "deepseq" = "1.4.5.0";
          "binary" = "0.8.8.0";
          "containers" = "0.6.4.1";
          };
        };
      };
  extras = hackage:
    {
      packages = {
        iserv-proxy = ./.plan.nix/iserv-proxy.nix;
        ghc = ./.plan.nix/ghc.nix;
        Win32 = ./.plan.nix/Win32.nix;
        remote-iserv = ./.plan.nix/remote-iserv.nix;
        ghci = ./.plan.nix/ghci.nix;
        ghc-boot = ./.plan.nix/ghc-boot.nix;
        iserv = ./.plan.nix/iserv.nix;
        libiserv = ./.plan.nix/libiserv.nix;
        hpc = ./.plan.nix/hpc.nix;
        };
      };
  modules = [
    ({ lib, ... }:
      {
        packages = {
          "iserv-proxy" = { flags = {}; };
          "ghc" = {
            flags = {
              "dynamic-system-linker" = lib.mkOverride 900 true;
              "stage2" = lib.mkOverride 900 false;
              "terminfo" = lib.mkOverride 900 true;
              "ghci" = lib.mkOverride 900 true;
              "stage3" = lib.mkOverride 900 false;
              "stage1" = lib.mkOverride 900 false;
              };
            };
          "Win32" = { flags = {}; };
          "remote-iserv" = { flags = {}; };
          "ghci" = { flags = { "ghci" = lib.mkOverride 900 true; }; };
          "ghc-boot" = { flags = {}; };
          "iserv" = { flags = {}; };
          "libiserv" = { flags = { "network" = lib.mkOverride 900 true; }; };
          "hpc" = { flags = {}; };
          };
        })
    ({ lib, ... }:
      {
        packages = {
          "filepath".components.library.planned = lib.mkOverride 900 true;
          "pretty".components.library.planned = lib.mkOverride 900 true;
          "bytestring".components.library.planned = lib.mkOverride 900 true;
          "remote-iserv".components.exes."remote-iserv".planned = lib.mkOverride 900 true;
          "exceptions".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
          "array".components.library.planned = lib.mkOverride 900 true;
          "Win32".components.library.planned = lib.mkOverride 900 true;
          "binary".components.library.planned = lib.mkOverride 900 true;
          "ghc-boot-th".components.library.planned = lib.mkOverride 900 true;
          "rts".components.library.planned = lib.mkOverride 900 true;
          "hsc2hs".components.exes."hsc2hs".planned = lib.mkOverride 900 true;
          "directory".components.library.planned = lib.mkOverride 900 true;
          "iserv".components.exes."iserv".planned = lib.mkOverride 900 true;
          "time".components.library.planned = lib.mkOverride 900 true;
          "network".components.library.planned = lib.mkOverride 900 true;
          "ghc".components.library.planned = lib.mkOverride 900 true;
          "ghc-bignum".components.library.planned = lib.mkOverride 900 true;
          "process".components.library.planned = lib.mkOverride 900 true;
          "template-haskell".components.library.planned = lib.mkOverride 900 true;
          "stm".components.library.planned = lib.mkOverride 900 true;
          "ghci".components.library.planned = lib.mkOverride 900 true;
          "ghc-boot".components.library.planned = lib.mkOverride 900 true;
          "hpc".components.library.planned = lib.mkOverride 900 true;
          "ghc-heap".components.library.planned = lib.mkOverride 900 true;
          "mtl".components.library.planned = lib.mkOverride 900 true;
          "transformers".components.library.planned = lib.mkOverride 900 true;
          "libiserv".components.library.planned = lib.mkOverride 900 true;
          "deepseq".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "containers".components.library.planned = lib.mkOverride 900 true;
          "iserv-proxy".components.exes."iserv-proxy".planned = lib.mkOverride 900 true;
          };
        })
    ];
  }