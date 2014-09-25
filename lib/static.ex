defmodule Unplug.Static do
  defmacro static(at: at, from: from) do
    quote do

      defmodule StaticPlug do
        use Plug.Builder

        plug Plug.Static, at: unquote(at), from: unquote(from)
        plug :not_found

        def not_found(conn, _) do
          Plug.Conn.send(conn, 404, "file not found")
        end
      end

      get unquote(at) <> "/*_rest" do
        conn
        |> StaticPlug.call(StaticPlug.init([]))
      end

    end
  end
end
