class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "d55cd20ee94c3fec9a79f9369a5b409ace3bc463c9e1ea2fd3d7f919706698ce"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.1/syntaqlite-macos-x64.tar.gz"
      sha256 "c4ee5ce813985278335b42d92aba5956abe8b7563212706e746b17f72e2490c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "a8bb7a2de8760c496d03d04e896edbbe3caf7ac3e65aa71d0fad7983dec13409"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.7.1/syntaqlite-linux-x64.tar.gz"
      sha256 "fb5d23bb64d8a29c0dbda4fbbbfb3176cfd812107863438b4d09816952962ed1"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
