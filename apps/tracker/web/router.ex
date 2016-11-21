defmodule Tracker.Router do
  use Tracker.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/tracker", Tracker do
    pipe_through :api

    get "/:redirect", TrackerController, :tracker
  end
    
end

