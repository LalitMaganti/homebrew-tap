class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "1475e3ed36f37abb9bac88b55539f1f98f5d1580da296e4ae4c78ee70a143d25"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.1/syntaqlite-macos-x64.tar.gz"
      sha256 "b124c8ca7e9c52f6be15d105349da1fb02a167c2bb01e668de7abc57b32bd855"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "4baa8e05b09400009ec1b7cdcc60b41499b4893573292b04f9c140b89e7d4e50"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.1/syntaqlite-linux-x64.tar.gz"
      sha256 "4f36e118aecae98bef6e79540ec16469c6ff1967abdb0c0994063122e4baf321"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
