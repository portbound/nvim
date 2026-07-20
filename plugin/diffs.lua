vim.pack.add({ "https://github.com/barrettruth/diffs.nvim" })

local function get_repo_root()
	local file = vim.api.nvim_buf_get_name(0)
	local dir = vim.fs.dirname(file)
	local git_dir = vim.fs.find('.git', { path = dir, upward = true })[1]
	if not git_dir then
		return nil
	end
	return vim.fs.dirname(git_dir)
end

local function get_default_branch(repo)
	local result = vim.system(
		{ 'git', '-C', repo, 'symbolic-ref', 'refs/remotes/origin/HEAD' },
		{ text = true }
	):wait()
	if result.code ~= 0 then
		return nil
	end
	return vim.trim(result.stdout):gsub('^refs/remotes/origin/', '')
end

vim.keymap.set("n", "<leader>d", function()
	local branch = vim.fn.input("Review against branch (leave blank for remote default): ")

	if branch == "" then
		local repo = get_repo_root()
		if repo then
			branch = get_default_branch(repo)
		end
	end

	vim.cmd('tabnew')
	vim.cmd('Diff review ++layout=split ' .. (branch or ''))
	-- vim.cmd('only')

	-- vim.schedule(function()
	-- 	vim.cmd('redraw')
	-- 	vim.api.nvim_echo({}, false, {})
	-- end)
end, { desc = "Git Review" })

vim.keymap.set("n", ">", "<Plug>(diffs-review-next-file)")
vim.keymap.set("n", "<", "<Plug>(diffs-review-next-file)")
