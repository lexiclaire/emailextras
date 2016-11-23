defmodule Tracker.TrackerController do
	use Tracker.Web, :controller
	require Logger
	alias URI

	def rewrite(conn, %{"document" => document}) do
		json(conn, %{"rewritten" => Rewriter.href_rewrite(document) |> Rewriter.src_rewrite(document)})
	end

	def tracker(conn, %{"redirect" => redirect}) do
		conn |> redirect(external: URI.decode_www_form(redirect))
	end
end