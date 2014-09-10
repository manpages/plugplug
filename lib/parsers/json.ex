defmodule Unplug.Parsers.JSON do
  alias Plug.Conn

  def parse(%Conn{} = conn, "application", "json", _, opts) do
    case Conn.read_body(conn, opts) do
      {:ok, body, conn} ->
        {:ok, JSEX.decode!(body), conn}
      {:more, _, conn} ->
        {:error, :too_large, conn}
    end
  end

  def parse(conn, _, _, _, _) do
    {:next, conn}
  end
end
