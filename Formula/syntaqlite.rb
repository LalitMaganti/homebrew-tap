class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "c20878eafe40823f8db3e474540d16222e876175d848a1d1424b4d3cfc612ebd"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.1/syntaqlite-macos-x64.tar.gz"
      sha256 "39f7ed942bff5daf735a243b03c45a01c4dde23b87693455e000860626a804a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "bcd3bda0382273f0defd3bfbc8340a4b79f68333842d472230d8c1af62a99c5c"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.1/syntaqlite-linux-x64.tar.gz"
      sha256 "052ced33d5b0b6a5a09357030f346f56f75760a5defd3408702de3323c84281a"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
