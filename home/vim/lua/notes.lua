M = {}


require'utils'.module_keymaps(M, "gz", { "i", "z", "Z", "n", "b", "B", "t", "[", "]", "g", "lj"})

function M.config()
    require'neuron'.setup {
        virtual_titles = true,
        mappings = true,
        run = nil, -- function to run when in neuron dir
        neuron_dir = "~/Library/Neuron",
        leader = require'notes'.leader, -- leader key, remember 'go zettel'
    }
    local notes = require'notes'
    table.foreach(
        {'i', 'z', 'Z', 'n', 'b', 'B', 't', '[', ']'},
        function(_, key) notes:reg_key(key); end
    )
    notes:set_key('g', require'utils'.tele_do'live_grep{cwd="~/Library/Neuron"}')
end

-- Ostalo je moj pokusaj

local function sh(cmd)
    local hand = io.popen(cmd)
    local res  = hand:read(); hand:close()
    return res
end

function M.on_enter()
    local word = vim.fn.expand("<cWORD>")
    local link = word:match("%[%w+%]%((.+)%)")
    local zettel =
           word:match("%[%[%w+%]%]")
        or word:match("#%[%[%w+%]%]")
        or word:match("%[%[%w+%]%]#")
    if link ~= nil then
       sh('$BROWSER '..link)
    elseif zettel ~= nil then
        require'neuron'.enter_link()
    end
end
function M.on_C_enter()
    local word = vim.fn.expand("<cWORD>")
    local link = word:match("%[%w+%]%((.+)%)")
    if link ~= nil then
        vim.api.nvim_put(
            {sh("w3m -dump "..link)},
            "l", true, true
        )
    end
end

-- click enter on [[my_link]] or [[[my_link]]] to enter it
--keymap("n", "<C-M>", "<cmd>lua On_C_enter()<CR>", {silent=true})

local function rand_word()
    local ascii_a = string.byte('a')
    local ascii_0 = string.byte('0')
    local nr = math.random(10 + 26)
    if nr <= 10 then nr = nr + ascii_0 - 1
    else nr = nr + ascii_a - 1 - 10 end
    return string.char(nr)
end
local function rand_name()
    local s = "" for _ = 1,8 do
       s = s..rand_word()
    end return s
end

function M.new_note()
    math.randomseed(os.time())
    local file repeat file = rand_name()
    until not require'plenary.path':new(file):exists()
    local time = os.date('%Y-%m-%dT%H:%M')
    vim.cmd(string.format(
        "edit ~/Library/Neuron/%s.md | :normal i---\ndate: %s\n---\n\n# ",
        file, time
    ))
end

return M
