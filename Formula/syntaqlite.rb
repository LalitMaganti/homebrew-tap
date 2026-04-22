class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.2/syntaqlite-macos-arm64.tar.gz"
      sha256 "c49c6b03781753cf4fad90cdde5c3ac70dbc22389af4a66251d0f414f2196977"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.2/syntaqlite-macos-x64.tar.gz"
      sha256 "544928b888f3b018f8a60aba61f9c70e37ab68ec3a36873e7f09be3110c556b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.2/syntaqlite-linux-arm64.tar.gz"
      sha256 "bc7edcdf1e4b274d515ada48782d751b397d75dfa959ceef7e4d485fbd2f0358"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.2/syntaqlite-linux-x64.tar.gz"
      sha256 "75f58fd7e0bfbe77fdaa768d7ba7ee3c9396c34032fbad82c645a72579d1a230"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
