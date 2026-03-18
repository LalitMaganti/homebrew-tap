class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.2.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.15/syntaqlite-macos-arm64.tar.gz"
      sha256 "07ac2a7c7a73f71a04123e6c753b88227d8a72f9b530c0d343c04858068f03c2"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.15/syntaqlite-macos-x64.tar.gz"
      sha256 "f023918dad95218d60875cc2ec8efafd98b6fefe9e1db57ba4fa95f3d146a716"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.15/syntaqlite-linux-arm64.tar.gz"
      sha256 "126a4c1cf0812195e52ecf713c7d9a7c838cce204e0d898abe29923581cb0dcb"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.15/syntaqlite-linux-x64.tar.gz"
      sha256 "2e659606f0398cf23907fc101f9af4e2674512dbe9d70ad9d5732e5c3366b2a9"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
