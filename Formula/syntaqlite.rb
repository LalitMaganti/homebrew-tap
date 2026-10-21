class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.2/syntaqlite-macos-arm64.tar.gz"
      sha256 "e6c4d626aef773d825f88c8545df7f961baf9960de57b75d5cf8e2a0d6a142ec"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.2/syntaqlite-macos-x64.tar.gz"
      sha256 "edaefb88bee37d0a3a5e5c752a209d38e69395fadbdd7119a334f17cbe6a85f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.2/syntaqlite-linux-arm64.tar.gz"
      sha256 "5024b0e7980f46039dda1525d81c939167e9b59ea2e533bb96b62daabc41dee5"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.2/syntaqlite-linux-x64.tar.gz"
      sha256 "cca8cdfdcdc09a32086c5dca8e4c871d67ad53ecf5dcd63a9f28f387100f238d"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
