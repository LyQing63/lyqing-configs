local M = {}

function M:peek(job)
	local path = tostring(job.file.url)
	local w = job.area.w

	local child =
		Command("glow"):args({ "--local", "-w", tostring(w), path }):stdout(Command.PIPED):stderr(Command.PIPED):spawn()

	if not child then
		ya.preview(job, "Failed to spawn glow")
		return
	end

	local output = child:wait_with_output()
	local text = output and output.stdout or ""
	ya.preview(job, text)
end

function M:seek(job)
	ya.preview_seek(job)
end

return M
