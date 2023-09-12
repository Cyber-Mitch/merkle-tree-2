# Merkle Tree Implementation in Elixir

A simple implementation of a Merkle Tree in Elixir. This implementation allows you to create a Merkle Tree from a list of transactions, verify transactions within the tree, and visualize the tree structure.

## Table of Contents
- [Usage](#usage)
- [Verifying a transaction](#verifying-a-transaction)
- [Visualizing the merkle tree](#visualizing-the-merkle-tree)
- [Implementation Details](#implementation-details)
- [Example](#example)

## Usage

### Creating a Merkle Tree
```elixir
# Define a list of transactions (e.g., financial transactions)
transactions = ["Alice pays Bob 5 BTC", "Bob pays Charlie 2 BTC", "Charlie pays Alice 1 BTC"]

# Create a Merkle Tree from the transactions
tree = MerkleTree.new(transactions)

```
## Verifying a transaction
### Verify a transaction within the Merkle Tree
```elixir
transaction = "Alice pays Bob 5 BTC"
verified = MerkleTree.verify(tree, transaction)

if verified do
  IO.puts("Transaction is verified.")
else
  IO.puts("Transaction is not verified.")
end
```
## Visualizing the Merkle Tree
### Visualize the Merkle Tree, including the Merkle Root and leaf hashes
```elixir
MerkleTree.visualize(tree)
```
## Implementation
### Implementation Details

- The Merkle Tree is a binary hash tree data structure.
- It uses SHA-256 cryptographic hashing to hash data elements.
- The tree is constructed recursively by pairing and hashing nodes until a root is obtained.
- A struct is used to represent the Merkle Tree, containing the Merkle Root and the list of leaf hashes.

## Example
```elixir
defmodule Main do
  def main do
    transactions = ["Alice pays Bob 5 BTC", "Bob pays Charlie 2 BTC", "Charlie pays Alice 1 BTC"]
    tree = MerkleTree.new(transactions)
    MerkleTree.visualize(tree)
  end
end

Main.main()
```
