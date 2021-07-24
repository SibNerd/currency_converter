defmodule ConverterWeb.ConverterLive do
  use ConverterWeb, :live_view

  alias Converter.{Convert}

  @impl true
  def mount(_params, _session, socket) do
    currencies = Convert.get_currency_infos()
    socket = socket
      |> assign(:currencies, currencies)
      |> assign(:convertion_result, 0)
    {:ok, socket}
  end

  @impl true
  def handle_event("get_convertion", %{"converter" => %{"currency_amount" => amount, "currency_name" => name}}, socket) do
    input = get_in(socket, assigns.currencies)
    for cuccency <- input do
      if currency["Name"] === name do
        value = cuccency["Value"]
      end
    
    result = value * amount

  {:noreply, assign(socket, convertion_result: result)}
  end

end