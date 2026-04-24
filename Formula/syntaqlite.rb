class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.6/syntaqlite-macos-arm64.tar.gz"
      sha256 "c27a4c870177d317050acffc03f5023ed81a1bb7f2586f90b817f99854d1323a"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.6/syntaqlite-macos-x64.tar.gz"
      sha256 "94611faa629839ee16d77a87988f945a1fe4fdf58efc9c4d586896903fe8f594"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.6/syntaqlite-linux-arm64.tar.gz"
      sha256 "c41cd50afa3d22639487187524f1c83e34f58d7d3fc01320dc370a2d8fffd398"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.6/syntaqlite-linux-x64.tar.gz"
      sha256 "f9bc7f071c248380cc8691a26e9c48f1c05a131181739475f06ed4a54d1ff662"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
