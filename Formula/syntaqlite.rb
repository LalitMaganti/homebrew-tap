class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.3/syntaqlite-macos-arm64.tar.gz"
      sha256 "381b78e5f38d02f11cf044c725df8c8200301fb4788f55f5b0482e4b8080784b"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.3/syntaqlite-macos-x64.tar.gz"
      sha256 "fa1cc74939b9f2c9cd636b82669414e3da2d1e9a4caf5796f6712377e05d8822"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.3/syntaqlite-linux-arm64.tar.gz"
      sha256 "c34d150206bbff02b472bdbf227be2c436f9deaf691fcd1ae8681c54556c874f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.3/syntaqlite-linux-x64.tar.gz"
      sha256 "2fdbf4f87af458f8ca2d6bcae9ea0e6556fb6c26c83e28897a2c43ff1cc16c04"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
