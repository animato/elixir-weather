# Weather

한국 기상청의 날씨 피드를 가져와 보여주는 애플리케이션

<처음 배우는 엘릭서 프로그래밍, 한빛미디어> 연습문제 13-5의 한국 데이터 버전

## 데이터
기상청 날씨 피드
- 전국: http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108
- 서울,경기도: http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `weather` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:weather, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/weather>.

