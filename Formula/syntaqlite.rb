class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.4/syntaqlite-macos-arm64.tar.gz"
      sha256 "8cc85864652da84736d6f91b2df9f940b678f6a696acb8921e2ee3f608733e04"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.4/syntaqlite-macos-x64.tar.gz"
      sha256 "733b91db87616bdafb7f4118ff07bdb94a8e673eb59d097ad7c16980dbdde61e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.4/syntaqlite-linux-arm64.tar.gz"
      sha256 "cfaff0d0a06591baf3602f853b35fb94d0d216f6fd9f569eb5b4571b67bc5c77"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.4/syntaqlite-linux-x64.tar.gz"
      sha256 "433fa7641dfb0ae4fb37d466398eeab79518a34b5f0367eb88143d6933d6de28"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
