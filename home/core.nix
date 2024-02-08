{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder

    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # productivity
    glow # markdown previewer in terminal

    # LaTeX
    texliveFull

    # terminal emulators
    kitty
  ];

  home.file = {
    ".config/karabiner/assets/complex_modifications/custom-capslock.json" = {
      enable = true;
      text = ''
        {
          "title": "Change caps_lock to Esc and Control",
          "rules": [
        	{
        	  "description": "Post Esc if Caps is tapped, Control if held.",
        	  "manipulators": [
                {
            "type": "basic",
            "from": {
                "key_code": "left_control",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "left_control",
                    "lazy": true
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "escape"
                }
            ]
        }
        	  ]
        	}
          ]
        }   
      '';
    };
  };

  programs = {
    # modern vim
    # neovim = {
    #   enable = true;
    #   defaultEditor = true;
    #   vimAlias = true;
    #   viAlias = true;
    # };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };

    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    skim = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
