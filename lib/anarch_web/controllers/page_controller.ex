defmodule AnarchWeb.PageController do
  use AnarchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
