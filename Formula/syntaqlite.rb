class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.2.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.16/syntaqlite-macos-arm64.tar.gz"
      sha256 "a72184fc56e9040d77892b7d34b5e982e28a7ea8b09e29a2dfd9bbb2b48376e4"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.16/syntaqlite-macos-x64.tar.gz"
      sha256 "9b40f779183b06488da53376720ab7df85f7db4af2fd35c9c3b6bf2e52b494c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.16/syntaqlite-linux-arm64.tar.gz"
      sha256 "eb41d103bd170821fb6017a106fd8d4a4e1f999736b53b1752e06b35520341a4"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.16/syntaqlite-linux-x64.tar.gz"
      sha256 "f322d4648812b3a8d5adcb6a4ff7826db92093dca34aaf7d414e3481194908e2"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
