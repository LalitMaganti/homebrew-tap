class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.8.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "f3a1488636cb5ea210115bed1304b5361503276a5c63ecb88c1f4c61be55a0b9"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.8.0/syntaqlite-macos-x64.tar.gz"
      sha256 "f7f69b57ba36d8340ef31e8aea32155456e737501c06b84841e137da392ab72d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.8.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "9c55ad36ac4f1ea3a61c3e31ff6a0ff76a36de327f7b11239fdb1fea8e8bc8b7"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.8.0/syntaqlite-linux-x64.tar.gz"
      sha256 "07591613fca609d4a7f637259e181d4bf1f2d3f311b2fee26118b65b8fe1a90c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
