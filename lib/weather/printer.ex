defmodule Weather.Printer do
  def print(data) do
    map = hd(data)
    title = map[:title]
    wf = Regex.replace(~r/<br\s*\/?>/, map[:wf], "\n")

    IO.puts(title)
    IO.puts("---")
    IO.puts(wf)
  end
end
