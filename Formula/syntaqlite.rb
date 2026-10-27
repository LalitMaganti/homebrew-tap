class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.3/syntaqlite-macos-arm64.tar.gz"
      sha256 "f20863902a777c90bdf914dfcd2f40b44ec77a79488ec00d367a5e42fd8a713f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.3/syntaqlite-macos-x64.tar.gz"
      sha256 "0e3d23ae39d3b1eaadfc6537cf9945775e8a8922a6d7b919f4b4870a61c513c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.3/syntaqlite-linux-arm64.tar.gz"
      sha256 "dada8d75ef49101f0319fd5276dada17a42e8d0440c0012d3b243afd19ff6256"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.3/syntaqlite-linux-x64.tar.gz"
      sha256 "fa21e11003a1fe662f36c2855f8c5d9071e4d7a3b367ae8fe4002e1073fb229b"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
