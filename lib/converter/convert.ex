defmodule Converter.Convert do

  alias Converter.{Currency}

  def get_currency_infos() do
    currencies = Currency.get_currencies() |> get_infos

    case currencies do
        {:ok, info} -> info
        :error -> "Some error occured: currencies are empty"
    end
  end

  def get_info(input) do
    output = Tuple.to_list(input) |> List.last
  end

  def get_infos(input) do
    output = Enum.map(input, fn i -> get_info(i) end)
    if output do
      {:ok, output}
    else
      :error
    end
  end

end 