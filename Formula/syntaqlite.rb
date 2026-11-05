class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.5/syntaqlite-macos-arm64.tar.gz"
      sha256 "55b6beb18d90e95af67226399d47f26c6861bc1c5c0352d76bd284f1e6823e44"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.5/syntaqlite-macos-x64.tar.gz"
      sha256 "cca74eda91e38d95c46d27bf2f1d7f2dd4738dccb4c7e69db099ed69cb83811f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.5/syntaqlite-linux-arm64.tar.gz"
      sha256 "42a9dd2c4077c9617714e1b7dda0a6ea8a15cdbaa24d12bb6c77e73338cebc32"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.5/syntaqlite-linux-x64.tar.gz"
      sha256 "3252a52e242d565565c019055d23513f292df4ff89e1f36ed95357343b5cba2c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
