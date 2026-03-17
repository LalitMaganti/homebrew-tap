class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.1.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "45cfc55d06c8c4990f406d439abbd5de2c03bf60f7cbb8afa978284aa5f894eb"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.1.0/syntaqlite-macos-x64.tar.gz"
      sha256 "effdecabd162f88ba3304ca7cd7cdae320350b162f21df7316be7450aa142775"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.1.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "e3d2bf1f0715bf7743354c32607ee59d1503a5c3c19db6d8e74063c8429bbb8f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.1.0/syntaqlite-linux-x64.tar.gz"
      sha256 "e38792d104d319ee6a4953771b74f8721fbe7e8bb5105141cc43096a0f58e830"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
