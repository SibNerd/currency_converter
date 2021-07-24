defmodule ConverterWeb.ConverterLive do
  use ConverterWeb, :live_view

  alias Converter.{Currency}

  @impl true
  def mount(_params, _session, socket) do

    {:ok, assign(socket, %{})}
  end

end