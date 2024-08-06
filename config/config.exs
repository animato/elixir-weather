import Config
config :weather, url: "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp"

config :logger,
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]
