defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence = String.downcase(sentence)

    Regex.scan(~r{[a-zäöüÄÖÜß0-9-]+}, sentence)
    |> Enum.flat_map(fn word -> word end)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
