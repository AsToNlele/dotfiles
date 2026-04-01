local M = {}

local function plugin_name(spec)
	if spec.name then
		return spec.name
	end

	local src = spec.src or ""
	local name = src:match("/([^/]+)$") or src
	return (name:gsub("%.git$", ""))
end

function M.repo(repo, opts)
	local spec = { src = "https://github.com/" .. repo }
	if opts then
		for key, value in pairs(opts) do
			spec[key] = value
		end
	end
	return spec
end

function M.add(specs, opts)
	vim.pack.add(specs, opts)
	for _, spec in ipairs(specs) do
		vim.cmd.packadd(plugin_name(spec))
	end
end

return M
