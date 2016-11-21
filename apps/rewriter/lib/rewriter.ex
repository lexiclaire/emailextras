defmodule Rewriter do

	def href_rewrite(document) do
		String.replace(document, "href=\"", "href=\"" <> Application.get_env(:rewriter, :tracker))
	end	

	def src_rewrite(document) do
		String.replace(document, "src=\"", "src=\"" <> Application.get_env(:rewriter, :tracker))
	end

end