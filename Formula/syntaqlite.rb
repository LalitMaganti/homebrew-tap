class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "eb94d94131a69396702885cb540078096f1b8587d0318d306ff675e4c703236b"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.0/syntaqlite-macos-x64.tar.gz"
      sha256 "3225589d68e165fdc0bc7713f723444897c3222eae961a86841c7d7138cc3ca4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "99cde5e546d0c1713017b0ad994a871553253148605b7e59190bb9ba4c1d2e0f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.0/syntaqlite-linux-x64.tar.gz"
      sha256 "af06850aa30393eb4cab79c4c5ed2f1459acad5cffa706f3312567a80c7a1f39"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
