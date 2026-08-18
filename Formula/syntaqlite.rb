class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.9.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "3ff674cec985dc18e2b373fe929d2c708e6da9a8cc5987701c0791e4558ad0d8"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.9.0/syntaqlite-macos-x64.tar.gz"
      sha256 "123797c18bafe084c7b0596e5539f444e9887e9b17af67a149445c2e45b0f12a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.9.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "4bf7b454003e58cfb78445e004f4e43940924b8512fa5cef84aa3108afa01924"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.9.0/syntaqlite-linux-x64.tar.gz"
      sha256 "3828a3f9a662f179827093caa58bbd05692e00433362027c1e074d46aba8520e"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
