class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "144a687cbbfb1de3f5f2a729827bf4204d7b0ff0445c32498826d8bbe61f0042"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.0/syntaqlite-macos-x64.tar.gz"
      sha256 "b6aa4e7ce09cc6f78d783ad248d7d3944051b1cb98ed381554a3a57b30d7b1b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "99178b4f14c3d701fdadeb209084380ba1a1993e9e31c58fbd224c74cfdb6aad"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.0/syntaqlite-linux-x64.tar.gz"
      sha256 "164216d43e0f972385b6e2ca77c3c9ca1dc83b073235d9feb4cf4c03b609ee86"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
