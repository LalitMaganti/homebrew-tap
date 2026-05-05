class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.7/syntaqlite-macos-arm64.tar.gz"
      sha256 "7956532e1d48252ac8b96a9d17ba316d7e43a1721b89c6997d2c157f31e27b8f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.7/syntaqlite-macos-x64.tar.gz"
      sha256 "b5ab08ecc6e3ea823eeb7b1c174d707d630ec647c23e440d2c9135352fb48f37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.7/syntaqlite-linux-arm64.tar.gz"
      sha256 "c06b1dd57a92cf0ad0ce7c1ccc38dd982cd08285fcfb5a267b6edc5cd3d86b92"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.7/syntaqlite-linux-x64.tar.gz"
      sha256 "96a74ca6f63182124b94c133bde1767f2b74dd5050bfa538ad1cf2664c2b3418"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
