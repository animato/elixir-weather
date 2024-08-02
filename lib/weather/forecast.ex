defmodule Weather.Forecast do
  def fetch() do
    url()
    |> HTTPoison.get()
    |> handle_response
  end

  def url() do
    "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:error, body}
  end
end
