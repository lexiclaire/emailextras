defmodule TemplaterTest do
  use ExUnit.Case
  doctest Templater

  require EEx

  test "When render function is called with a map and EEx template it returns a rendered string" do
  	inputData = %{"name" => "Jasper", "age" => 8}
  	inputTemplate = ~s(Hello <%= map["name"] %>, you're <%= map["age"] %>!)

    assert "Hello Jasper, you're 8!" == Templater.render(inputTemplate, inputData)
  end
end

