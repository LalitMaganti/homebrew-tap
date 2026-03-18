class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.2.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.11/syntaqlite-macos-arm64.tar.gz"
      sha256 "47c4bb11cc6d798356ca00cdb57b2916acd234d77e2ed667bdc2a20686a9f37a"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.11/syntaqlite-macos-x64.tar.gz"
      sha256 "9f42aee9e97c20c48fb1b7b63b1424dffa25e7366f8a024ac172ae38a6712c22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.11/syntaqlite-linux-arm64.tar.gz"
      sha256 "ea6cc5cd7b28aa4d2b1ada3e66b3f5396b6b0a849dd5c24fb03dda805cb085ca"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.11/syntaqlite-linux-x64.tar.gz"
      sha256 "cfa81e8047eac33072261f47e23d44e7e391e942eb8ad7f2517a40b28cf62a55"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
