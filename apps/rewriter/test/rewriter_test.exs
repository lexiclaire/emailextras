defmodule RewriterTest do
  use ExUnit.Case
  doctest Rewriter

  test "I can identify href attributes in a rendered document and insert a tracker address" do
  	documentSample = ~s(Corned beef filet mignon <a href="https://en.wikipedia.org/wiki/Kielbasa">kielbasa</a> <img src="https://en.wikipedia.org/wiki/Kielbasa#/media/File:Kielbasa.jpg" /> shank tongue pork loin, porchetta brisket hamburger biltong landjaeger pastrami leberkas bresaola.)

  	rewrittenHref = ~s(Corned beef filet mignon <a href="#{ Application.get_env(:rewriter, :tracker) }https://en.wikipedia.org/wiki/Kielbasa">kielbasa</a> <img src="https://en.wikipedia.org/wiki/Kielbasa#/media/File:Kielbasa.jpg" /> shank tongue pork loin, porchetta brisket hamburger biltong landjaeger pastrami leberkas bresaola.)	
  	rewrittenSrc = ~s(Corned beef filet mignon <a href="https://en.wikipedia.org/wiki/Kielbasa">kielbasa</a> <img src="#{ Application.get_env(:rewriter, :tracker) }https://en.wikipedia.org/wiki/Kielbasa#/media/File:Kielbasa.jpg" /> shank tongue pork loin, porchetta brisket hamburger biltong landjaeger pastrami leberkas bresaola.)

  	rewrittenHrefAndSrc = ~s(Corned beef filet mignon <a href="#{ Application.get_env(:rewriter, :tracker) }https://en.wikipedia.org/wiki/Kielbasa">kielbasa</a> <img src="#{ Application.get_env(:rewriter, :tracker) }https://en.wikipedia.org/wiki/Kielbasa#/media/File:Kielbasa.jpg" /> shank tongue pork loin, porchetta brisket hamburger biltong landjaeger pastrami leberkas bresaola.)

    assert Rewriter.href_rewrite(documentSample) == rewrittenHref

    assert Rewriter.src_rewrite(documentSample) == rewrittenSrc

    assert Rewriter.href_rewrite(documentSample) |> Rewriter.src_rewrite == rewrittenHrefAndSrc

    assert Rewriter.src_rewrite(documentSample) |> Rewriter.href_rewrite == rewrittenHrefAndSrc
    
  end

end
