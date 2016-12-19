defmodule Service.TrackerController do
	use Service.Web, :controller
	require Logger
	alias URI

	def tracker(conn, %{"redirect" => redirect}) do
		conn |> redirect(external: URI.decode_www_form(redirect))
	end
end