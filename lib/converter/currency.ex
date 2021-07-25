defmodule Converter.Currency do
  def get_currencies() do
    result = "https://www.cbr-xml-daily.ru/daily_json.js"
    |> HTTPoison.get
    |> parse_json

    case result do
      {:ok, info} -> info
      :error -> "Could not fetch currency API"
    end
  end

  defp parse_json({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_currencies
  end

  defp parse_json(_), do: :error

  defp pull_currencies(%{"Valute" => valute}) do
    :ets.new(:currencies, [:named_table, :set, :protected])
      for {key, value} <- valute do
        :ets.insert(:currencies, {key, value})
      end
    currencies = :ets.tab2list(:currencies)
    if currencies do
      res_info = {:ok, currencies}
    else 
      {:error, "Could not make list from ets table"}
    end
  end

  defp pull_currencies(_), do: :error

end
