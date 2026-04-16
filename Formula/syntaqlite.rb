class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "74de91950b0bd14fd1c09dff79d8f1a2a5d7de8c45e04d6ee55f923237d87c64"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.0/syntaqlite-macos-x64.tar.gz"
      sha256 "110fad9428364c0116c315139017b9122ffdfdebb7ea66092fb76c597d8f3856"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "39a1cba0d150fd11e8bc8120795fe3b91a66b5d0edc66e488ab706c49cf6b389"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.0/syntaqlite-linux-x64.tar.gz"
      sha256 "338e7e0fa837f9567d6a054e09cd9a87b4d2c731e8e6551a7c465330352a99f2"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
