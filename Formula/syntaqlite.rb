class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.10.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "88155719ad989b2ea1866fe240e850e806cace80a5a29029cc218cd9a267830e"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.1/syntaqlite-macos-x64.tar.gz"
      sha256 "e7c534b5389381c8102c4258cbd6be0c2125ab52b6b8a879e33200c19edf538b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "df293ab3cf6b92143d7171cd48b68c9a3dc90b172b11b73815e65efa4c894a14"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.1/syntaqlite-linux-x64.tar.gz"
      sha256 "469f20daaa88fb8b8abe8baa9d1ab3e0eadea2f67ede4ceb44fc71d7150a1018"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
