{ pkgs, ... }:
{
  programs.nixvim = {

    enable = true;

    # mapleader
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    # colorscheme
    colorschemes.kanagawa.enable = true;
    
    plugins = {

      # buffer line
      bufferline.enable = true;

      # lualine
      lualine = {
        enable = true;
        componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        sections = {
          lualine_c = [
            {
              name = "filename";
              extraConfig = {
                path = 1;
              };
            }
          ];
        };
      };

      # fuzzy finder

      # treesitter
      treesitter = {
        enable = true;
        indent = false;
        nixvimInjections = true;
      };

      # treesitter context
      treesitter-context.enable = true;

      # git related plugins
      fugitive.enable = true;

      # lsp config
      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          pylsp.enable = true;
          nil_ls.enable = true;
          marksman.enable = true;
          yamlls.enable = true;
        };
      };
      lspkind.enable = true;
      none-ls.enable = true;

    };

    # treesitter-context keymap
    keymaps = [
      {
        mode = "n";
        key = "<leader>tc";
        action = "<cmd>TSContextToggle<CR>";
        options.desc = "Toggle treesitter context";
      }
    ];

    # extra plugins not packaged by nixvim
    extraPlugins = with pkgs.vimPlugins; [
      # extension for fugitive
      vim-rhubarb
      # Detect tabstop and shiftwidth automatically
      vim-sleuth
    ];
  };
}
