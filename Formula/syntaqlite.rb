class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.0.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.21/syntaqlite-macos-arm64.tar.gz"
      sha256 "477ab4b3341d3b08e6f557f7057fa123aee9ae49ced56c6c3412253bc27cf837"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.21/syntaqlite-macos-x64.tar.gz"
      sha256 "e1a9415182e0f5badc8395ae6d27f4e6b576e27cc318363f6ad445bd30cdd0a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.21/syntaqlite-linux-arm64.tar.gz"
      sha256 "2be21d835e24abbac3c8f4eb92ced707d6a27059bcb0460a42a8f854456c5b08"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.21/syntaqlite-linux-x64.tar.gz"
      sha256 "58de25ba7df8d98bcb5c843d17f6bcc1023266ec3e799ae3878cc072c28e69c6"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
