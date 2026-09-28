class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.12.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "c3ac266b2da0e7932a74e2d1bb222202b8a83db000195f4c7a5f1191eacf1934"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.1/syntaqlite-macos-x64.tar.gz"
      sha256 "6bd729aad0f89e0eac68cc52f8f85fc074e7d90c49aef9d668ff192470fa9c1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "49ac24b916db7eece63984d5141f9f4aa16d83f7d2f86a33d46eca647f7bba98"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.1/syntaqlite-linux-x64.tar.gz"
      sha256 "b55c12f33c07ae4dc16ae66520b4d12cfa8e4383fb3edf83ede16c7fd95241ef"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
