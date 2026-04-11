class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "d4d6d761efd2de3e1c4caa3cd2c2f7531cb01f908587fd3cfb370d4519306bcc"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.1/syntaqlite-macos-x64.tar.gz"
      sha256 "618e82b59154d5ee05fc9fd3c2791145bff4b4a2acea58e4ead5f7bd1b57c23f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "e271d984e8f51b7902fb35a93eac0dc5f148ea095cf38fb33a2d8edb11302cab"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.3.1/syntaqlite-linux-x64.tar.gz"
      sha256 "2224df27bf2d9361a4cb890979c313299794ed0e4f2d8a06fbdad329db58100d"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
