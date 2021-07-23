defmodule ConverterWeb.PageLive do
  use ConverterWeb, :live_view

  alias Converter.{Currency}

  @impl true
  def mount(_params, _session, socket) do
    Currency.get_currencies()

    dollar = :ets.lookup(:currencies, "USD") |> List.first |> Tuple.to_list
    [_ | dollar_info] = dollar
    dollar_name = List.first(dollar_info) |> Map.fetch!("Name")
    dollar_value = List.first(dollar_info) |> Map.fetch!("Value")

    euro = :ets.lookup(:currencies, "EUR") |> List.first |> Tuple.to_list
    [_ | euro_info] = euro
    euro_name = List.first(euro_info) |> Map.fetch!("Name")
    euro_value = List.first(euro_info) |> Map.fetch!("Value")

    {:ok, assign(socket, results: %{dollar_name: dollar_name, dollar_value: dollar_value, euro_name: euro_name, euro_value: euro_value})}
  end

  def render(assigns) do

  end

end
