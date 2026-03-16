class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.0.31"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.31/syntaqlite-macos-arm64.tar.gz"
      sha256 "57a01607b9f42bb0a519af89124d260c73454ce19e88ee71c41fad80c24bdd1b"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.31/syntaqlite-macos-x64.tar.gz"
      sha256 "7aa486f456629487330648d8a476fad9ec6c7030a8fedb6120000e7014cfcd3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.31/syntaqlite-linux-arm64.tar.gz"
      sha256 "b371fa03696041c4b5b7ac91d989c024b85ff84aab184322a87746e792c2f5aa"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.31/syntaqlite-linux-x64.tar.gz"
      sha256 "cdfb18109d51c6353cbba427283745354c7e2acc4e195bbbbb2e4db054bf8f5c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
