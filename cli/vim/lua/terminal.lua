-- https://stackoverflow.com/questions/37232418/toggle-neovim-terminal-buffer-like-nerdtree-plugin
M = {}
function M.setup_old()
vim.cmd[[
    let g:term_buf = 0
    let g:term_win = 0
    function! Term_toggle(height)
        if win_gotoid(g:term_win)
            hide
        else
            botright new
            exec "resize " . a:height
            try
                exec "buffer " . g:term_buf
            catch
                call termopen($SHELL, {"detach": 0})
                let g:term_buf = bufnr("")
            endtry
            startinsert!
            let g:term_win = win_getid()
        endif
    endfunction
    
    
    nnoremap <M-t> :call Term_toggle(10)<cr>
    tnoremap <M-t> <C-\><C-n>:call Term_toggle(10)<cr>
    ]]
end

--function M.setup_shit()
--    local cur_winid = vim.api.nvim_get_current_win
--    local Terminal = {
--    	bufs = {},
--    	last_winid = nil,
--    	last_term = nil,
--        new = function(self, window, opt)
--    	    self.window = window or Window:new()
--    	    return self
--        end
--    }
--
--    function Terminal:open(term_number)
--    	local create_win = not self.window:is_valid()
--    	local create_buf = self.bufs[term_number] == nil
--    
--        if create_win then self.last_winid = cur_winid() end
--    	-- window and buffer does not exist
--    	if create_win and create_buf then
--    		self.window:create_term()
--    		table.insert(self.bufs, self.window:get_buf())
--    
--    	-- window does not exist but buffer does
--    	elseif create_win then
--    		self.window:create(self.bufs[term_number])
--    	-- buffer does not exist but window does 
--    	elseif create_buf then
--    		self.window:focus()
--    		vim.cmd(':terminal')
--    		table.insert(self.bufs, self.window:get_buf())
--    
--    	-- buffer and window exist
--    	else
--    		local curr_term_buf = self.bufs[term_number]
--    		local last_term_buf = self.bufs[self.last_term]
--    
--    		if curr_term_buf ~= last_term_buf then
--    			self.window:set_buf(curr_term_buf)
--    		end
--    	end
--    
--    	self.last_term = term_number
--    end
--
--    function Terminal:close()
--    	if self.window:is_valid() then
--    		self.window:close()
--    		if cur_winid() == self.window.winid then
--    			vim.api.nvim_set_current_win(self.last_winid)
--    		end
--    	end
--    end
--
--    function Terminal:toggle()
--        if self.window:is_valid()
--            then self:close() else self:open(self.last_term or 1) end
--    end
--
--    local Window = {
--        new = function (self, opt)
--    	    opt = opt or {}
--    	    self.pos    = opt.pos or 'botright'
--    	    self.split  = opt.split or 'sp'
--    	    self.width  = opt.width
--    	    self.height = opt.height
--    
--    	    return self
--        end
--        is_valid = function (self)
--        	return self.winid and vim.api.nvim_win_is_valid(self.winid)
--        end
--        --focus = function (self) if self:is_valid()
--        --	then vim.api.nvim_set_current_win(self.winid) end
--        --end
--        close = function (self) if self:is_valid()
--            then vim.api.nvim_win_close(self.winid, false) end
--        end
--        set_buf = function (s, bufno)
--        	return s:is_valid() and vim.api.nvim_win_set_buf(s.winid, bufno)
--        end
--        get_buf = function (s)
--        	return s:is_valid() and vim.api.nvim_win_get_buf(s.winid)
--        end
--        from_buff = function (self, bufnr)
--    	    vim.cmd('%s %s +buffer\\ %d':format(self.pos, self.split, bufnr))
--    	    return self:update()
--        end
--        create_term = function (self)
--    	    vim.cmd('%s new +term':format(self.pos))
--    	    return self:update()
--        end
--        update = function (self)
--    	    self.winid = cur_winid()
--    	    if self.width
--                then vim.api.nvim_win_set_width(self.winid, self.width) end
--    	    if self.height
--                then vim.api.nvim_win_set_height(self.winid, self.height) end
--            return self.winid
--        end
--        -- get_size
--        -- vim.api.nvim_win_get_width(self.winid)
--        -- vim.api.nvim_win_get_height(self.winid)
--    }
--    return Terminal:new(Window:new())
--end

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
