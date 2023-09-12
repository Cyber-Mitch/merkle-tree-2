defmodule MerkleTree do
  defstruct [:root, :leaves]

  def new(transactions) do
    leaves = Enum.map(transactions, &hash/1)
    root = build_tree(leaves)
    %MerkleTree{root: root, leaves: leaves}
  end

  defp build_tree([hash]), do: hash
  defp build_tree(hashes) do
    hashes
    |> Enum.chunk_every(2, 2, :discard)
    |> Enum.map(&hash(Enum.join(&1)))
    |> build_tree()
  end

  defp hash(data), do: :crypto.hash(:sha256, data) |> Base.encode16(case: :lower)

  def verify(tree, transaction) do
    hash(transaction) in tree.leaves
  end

  def visualize(tree) do
    IO.puts "Root: #{tree.root}"
    Enum.each(tree.leaves, &IO.puts("Leaf: #{&1}"))
  end
end

defmodule Main do
  def main do
    transactions = ["Alice pays Bob 5 BTC", "Bob pays Charlie 2 BTC", "Charlie pays Alice 1 BTC"]
    tree = MerkleTree.new(transactions)
    MerkleTree.visualize(tree)
  end
end

Main.main()
