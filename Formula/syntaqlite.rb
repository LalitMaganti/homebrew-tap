class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.4/syntaqlite-macos-arm64.tar.gz"
      sha256 "e9aee6a9837b1a1528c21378853750e707c3b28a6135ad2272e2905265b114c0"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.4/syntaqlite-macos-x64.tar.gz"
      sha256 "95a4ae2b9e1b04a15667c4ec8cb2fde0184b0c184261e01353551ac9ab243038"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.4/syntaqlite-linux-arm64.tar.gz"
      sha256 "76ca54de3f8078cfc371ccc0f1f59a6309abd61eee4704a9ae4ee70733d7edb8"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.4/syntaqlite-linux-x64.tar.gz"
      sha256 "bbc3548f4902c4ebd89341f92464306ffb1d84b5a98153e7f0e9931e5f43bf07"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
