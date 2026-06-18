class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.6.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "6c6c4f9499f011dfebdc2472f5cf7d7783448c3dc651be543acb19510847175e"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.6.0/syntaqlite-macos-x64.tar.gz"
      sha256 "b27afe7a9c9e5df118b442a06a9f962b12a7edcea7e513d0c1f904f7b9a61d8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.6.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "a4776145066dd5b073907ea4045a7dea331c04ea46b180288d6cfc1897598896"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.6.0/syntaqlite-linux-x64.tar.gz"
      sha256 "e7554079b7dc11c01522a1204add6febcf81bc46dbc13b3526869a320ed5d2ae"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
