class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.10.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.2/syntaqlite-macos-arm64.tar.gz"
      sha256 "1794bcd644ab6f4d5d7b9815bfc6efff16ac7bc62e6a4c7d9cbc2cd3243d8617"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.2/syntaqlite-macos-x64.tar.gz"
      sha256 "9ac0a0c36ae79f08d8c6afd545537d89dea11f764e6ded04fd523677a78a4785"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.2/syntaqlite-linux-arm64.tar.gz"
      sha256 "12f06cf2ee44e7501e36607b69ff3b245c09c906f21ffa52f3c615ca74da9490"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.10.2/syntaqlite-linux-x64.tar.gz"
      sha256 "e92e0489545f2c72a00a2b7f398216d8d92d19f0e62e5d726530bc39a57833fb"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
