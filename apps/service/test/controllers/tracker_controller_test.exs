defmodule Service.TrackerControllerTest do
	use Service.ConnCase, async: true

	test "GET /tracker" do

		redirectSample = URI.encode_www_form "https//www.youtube.com"
  	
  	conn = build_conn 
  	|> get("/tracker/#{redirectSample}")
  	assert response(conn, 302)
  end  
end