{
  lib,
  config,
  ...
}: {
  options = {
    nixvim.enable = lib.mkEnableOption "enables nixvim";
  };
  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      opts = {
        number = true;
      };
      enable = true;
      extraConfigLua = ''        vim.api.nvim_create_autocmd("VimEnter", {
        	callback = function()
        		vim.schedule(function()
        		  vim.cmd("source $MYVIMRC")
        		  vim.cmd("redraw!")
        		  end)
        	end,
        })'';
      colorschemes.nord.enable = true;
      plugins.lsp = {
        enable = true;
        servers = {
          nil-ls = {
            enable = true;
            autostart = true;
            settings = {
              flake = {
                autoArchive = true;
              };
            };
          };
          pylsp.enable = true;
          lua-ls.enable = true;
        };
      };
      plugins.cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        settings = {
          mapping = {
            __raw = ''
                  cmp.mapping.preset.insert({
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                   	  if cmp.visible() then
                         cmp.select_next_item()
                       else
                         fallback()
                       end
               	end, { "i", "s"})})
            '';
          };
        };
      };
      plugins.lualine = {
        enable = true;
        settings = {
          options = {
            component_separators = "|";
            section_separators = {
              left = "";
              right = "";
            };
          };
          sections = {
            lualine_a = [{__raw = ''{ 'mode', separator = { left = '', right = '' } }'';}];
            lualine_b = ["filename" "branch"];
            lualine_c = ["%="];
            lualine_x = [""];
            lualine_y = ["filetype" "progress"];
            lualine_z = [{__raw = ''{ 'location', separator = { left = '', right = '█' }, }'';}];
          };
        };
      };
    };
  };
}
