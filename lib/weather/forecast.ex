defmodule Weather.Forecast do
  require Logger
  @url Application.compile_env(:weather, :url, "?")

  def fetch(region) do
    Logger.info("#{region} 지역 중기예보를 가져옵니다.")

    url(region)
    |> HTTPoison.get()
    |> handle_response
  end

  def url(region) do
    # "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109"
    # "https://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=2824561100"
    code =
      case region do
        "전국" -> 108
        "서울경기도" -> 109
      end

    "#{@url}?stnId=#{code}"
  end

  def handle_response({:ok, %{status_code: status_code, body: body}}) do
    Logger.info("응답을 받았습니다: status code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)

    {
      status_code |> check_for_error(),
      body |> parse_xml()
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error

  def parse_xml(xml_string) do
    {xml, _} =
      xml_string
      |> :erlang.binary_to_list()
      |> :xmerl_scan.string()

    extract_items(xml)
  end

  defp extract_items(xml) do
    xml
    |> xpath('//item')
    |> Enum.map(&parse_item/1)
  end

  defp parse_item(item) do
    title = xpath(item, './title/text()') |> hd() |> elem(4) |> List.to_string()
    link = xpath(item, './link/text()') |> hd() |> elem(4) |> List.to_string()
    wf = xpath(item, './description/header/wf/text()') |> hd() |> elem(4) |> List.to_string()
    tm = xpath(item, './description/header/tm/text()') |> hd() |> elem(4)
    %{title: title, link: link, wf: wf, tm: tm}
  end

  defp xpath(xml, path) do
    :xmerl_xpath.string(path, xml)
  end
end
