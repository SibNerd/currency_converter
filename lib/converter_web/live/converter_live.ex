defmodule ConverterWeb.ConverterLive do
  use ConverterWeb, :live_view

  alias Converter.{Convert}

  @impl true
  def mount(_params, _session, socket) do
    currencies = Convert.get_currency_infos()
    topic = "convertion_page"
    ConverterWeb.Endpoint.subscribe(topic)
    socket = socket
      |> assign(:currencies, currencies)
      |> assign(:convertion_result, 0)
    {:ok, socket}
  end

  @impl true
  def handle_event("get_convertion", %{"converter" => %{"currency_amount" => amount, "currency_name" => name}}, socket) do
    currency = socket.assigns.currencies |> Enum.find(fn x -> x["Name"] == name end)
    value = currency["Value"]
    result = value * String.to_integer(amount)
    ConverterWeb.Endpoint.broadcast(socket.assigns, "get_convertion", result)
    {:noreply, socket}
  end
  
  @impl true
  def handle_event(%{event: "get_convertion", payload: result}, socket) do
    {:noreply, assign(socket, convertion_result: result)}
  end

end