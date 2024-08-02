defmodule Weather.Cli do
  @moduledoc """
  명령줄 파싱을 수행한 뒤 각종 함수를 호출해 기상청 날씨 정보를 출력
  """

  def run(argv) do
    parse_args(argv)
    |> process
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

  def args_to_internal({_, [city], _}) do
    {city}
  end

  def args_to_internal({_, [], _}) do
    {"인천"}
  end

  def args_to_internal({_, _, _}) do
    :help
  end

  def process(:help) do
    IO.puts("""
    usage: weather <도시이름>
    """)

    System.halt(0)
  end

  def process({city}) do
    Weather.Forecast.fetch()
  end
end
