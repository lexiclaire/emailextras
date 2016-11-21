defmodule Service.TemplaterControllerTest do
	use Service.ConnCase

	test "POST /api/render", %{conn: conn} do
		conn = post conn, "/api/render", [template: "Hello", data: %{}]
		assert json_response(conn, 200) =~ "Hello"
	end

	test "POST to /api/render, this time with data", %{conn: conn} do
		conn = post conn, "/api/render", [template: "Hello <%= map[\"name\"] %>", data: %{"name" => "Jasper"}]
		assert json_response(conn, 200) =~ "Hello Jasper"
	end
end