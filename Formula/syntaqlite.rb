class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.0.33"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.33/syntaqlite-macos-arm64.tar.gz"
      sha256 "1b1fc234f328e5f56767a39ba9ad3095353c2c0499dca4486fac8b76391ac7b8"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.33/syntaqlite-macos-x64.tar.gz"
      sha256 "fd361fd7e2e54cbdb1480b0a5a7fb64b803e2089e1d2e50b35ace2a9eb4508b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.33/syntaqlite-linux-arm64.tar.gz"
      sha256 "f82a7abc82831b488c4e254f51f257b66b17e3cb3225d4c3edfe9b874e2b2082"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.33/syntaqlite-linux-x64.tar.gz"
      sha256 "a58f33fcf74de781af423ab4cef6ec2b05f37b8aee8abc6c05bc57e2c0dfeab5"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
