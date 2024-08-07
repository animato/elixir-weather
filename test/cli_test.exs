defmodule WeatherCliTest do
  use ExUnit.Case
  doctest Weather

  import Weather.Cli, only: [parse_args: 1]

  test "-h나 --help가 옵션으로 파싱되면 :help가 반환된다." do
    assert parse_args(["-h", "아무거나1"]) == :help
    assert parse_args(["--help", "아무거나2"]) == :help
  end

  test "파라미터로 지역 값을 전달하면 지역 값이 반환된다" do
    assert parse_args(["인천"]) == {"인천"}
    assert parse_args(["서울"]) == {"서울"}
  end

  test "파라미터로 지역 값을 전달하지 않으면 기본 지역 값이 반환된다" do
    assert parse_args([]) == {"전국"}
  end
end
