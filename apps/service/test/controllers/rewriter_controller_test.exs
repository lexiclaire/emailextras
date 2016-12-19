defmodule Service.RewriterControllerTest do
	use Service.ConnCase, async: true

  test "POST /rewrite Href and Src", %{conn: conn} do
  	documentSample = ~s(Corned beef filet mignon <a href="https://en.wikipedia.org/wiki/Kielbasa">kielbasa</a> <img src="https://en.wikipedia.org/wiki/Kielbasa#/media/File:Kielbasa.jpg" /> shank tongue pork loin, porchetta brisket hamburger biltong landjaeger pastrami leberkas bresaola.)

  	response = build_conn 
  	|> post("/rewrite", [document: documentSample])
  	|> json_response(200)
    assert String.match? response["rewritten"], ~r/href.*?trackme.please/
    assert String.match? response["rewritten"], ~r/src.*?trackme.please/

  end
end
