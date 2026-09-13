class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "5750bad851c39d486e3f4abc1e84836e6008c85e4a78f62724a8f2e24b330242"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.0/syntaqlite-macos-x64.tar.gz"
      sha256 "06f410ee59825aaa4430785388a34e5d1341ad6dbf2748114f6232161e759236"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "7648163f78b2908f6940c2d3ab7e1ec7bd4426a121e3d1f782abc19798577d46"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.0/syntaqlite-linux-x64.tar.gz"
      sha256 "0abf0a24afb361bbef14b08bdd7d7c58a85211db6dbc4a875429497b16ffe364"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
