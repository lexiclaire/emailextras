defmodule Templater do

	def render(template, data) do
		EEx.eval_string template, [map: data]
	end
end