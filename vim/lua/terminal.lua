-- https://stackoverflow.com/questions/37232418/toggle-neovim-terminal-buffer-like-nerdtree-plugin
M = {}

function M.setup()
    Window = {
        new = function (self, opt)
    	    opt = opt or {}
    	    self.pos    = opt.pos or 'botright'
    	    self.split  = opt.split or 'sp'
    	    self.cols   = opt.cols or 10
            if not self.buf then
                self.buf = vim.api.nvim_create_buf(false, false)
                vim.api.nvim_open_term(self.buf, {})
            end
            vim.cmd(self.pos .. " " .. self.cols .. " " .. self.split)
            self.id = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_buf(self.id, self.buf)
        end
    }
    return Window
end

return M
