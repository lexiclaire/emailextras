defmodule Service.RewriterController do
	use Service.Web, :controller
	alias Rewriter
	require Logger

	def rewrite(conn, %{"document" => document}) do
		json(conn, %{"rewritten" => Rewriter.href_rewrite(document) |> Rewriter.src_rewrite})
	end

end