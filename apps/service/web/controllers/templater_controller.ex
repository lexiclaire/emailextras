defmodule Service.TemplaterController do
	require Logger
  use Service.Web, :controller
  alias Templater

  def render(conn, %{"template" => template, "data" => data}) do 
  	Logger.info "Client IP: #{conn.remote_ip |> Tuple.to_list |> Enum.join(".")}, " <> 
  		"Template length: #{String.length(template)}"
  	json(conn, %{"rendered" => Templater.render(template, data)}) 
  end
end