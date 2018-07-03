defmodule MiphaWeb.PageController do
  use MiphaWeb, :controller

  alias Mipha.Topics

  def index(conn, _params) do
    parent_nodes = Topics.list_parent_nodes

    {odd, even} =
      Topics.list_topics
      |> Enum.with_index
      |> Enum.split_with(fn {t, i} -> rem(i, 2) == 0 end)

    render conn, :index,
      odd_topics: odd,
      even_topics: even,
      parent_nodes: parent_nodes
  end
end
