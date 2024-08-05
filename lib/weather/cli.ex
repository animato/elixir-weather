defmodule Weather.Cli do
  import Weather.Printer, only: [print: 1]

  @moduledoc """
  명령줄 파싱을 수행한 뒤 각종 함수를 호출해 기상청 날씨 정보를 출력
  """

  def main(argv) do
    parse_args(argv)
    |> process
    |> print
  end

  @doc """
  'argv' 는 -h 또는 --help
  """
  def parse_args(argv) do
    # -h 일 경우는 :help

    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> args_to_internal
  end

  def args_to_internal({[help: true], _, _}) do
    :help
  end

  def args_to_internal({_, [region], _}) do
    {region}
  end

  def args_to_internal({_, [], _}) do
    {"전국"}
  end

  def args_to_internal({_, _, _}) do
    :help
  end

  def process(:help) do
    IO.puts("""
    usage: weather <지역이름: 전국, 서울경기도>
    """)

    System.halt(0)
  end

  def process({region}) do
    Weather.Forecast.fetch(region)
    |> decode_response()
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    IO.puts("기상 정보 획득 에러: #{error["message"]}")
    System.halt(2)
  end
end
