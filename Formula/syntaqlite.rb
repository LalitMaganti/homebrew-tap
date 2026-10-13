class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "8b38d9b83c980e37d5b8d8b4dae73b6752378dc076fd3a6160710e13554171d6"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.0/syntaqlite-macos-x64.tar.gz"
      sha256 "bbe06b7d2d628b382e98414baedc56e26c528a3c122a84fa6e99ec6cd61ddbe2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "1744095aa6499ed373246cfd94e77fa529f547124173c481905c49837ea5df76"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.0/syntaqlite-linux-x64.tar.gz"
      sha256 "77ef2f9491958fbf2e97a6454f6514aaa643fcc8e89666c332bd6487226d9989"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
