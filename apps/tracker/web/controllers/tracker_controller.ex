defmodule Tracker.TrackerController do
	use Tracker.Web, :controller
	require Logger
	alias URI

	def tracker(conn, %{"redirect" => redirect}) do
		#post statement
		conn |> redirect(external: URI.decode_www_form(redirect))
	end
end