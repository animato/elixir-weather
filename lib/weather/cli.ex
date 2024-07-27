defmodule Weather.Cli do
  @moduledoc """
  명령줄 파싱을 수행한 뒤 각종 함수를 호출해 기상청 날씨 정보를 출력
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  'argv' 는 -h 또는 --help
  """
  def parse_args(argv) do
    # -h 일 경우는 :help
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _} -> :help
      {_, [city], _} -> {city}
      {_, _, _} -> {"인천"}
      _ -> :help
    end
  end
end
