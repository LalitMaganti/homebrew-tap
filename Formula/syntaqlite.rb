class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.14.0/syntaqlite-0.14.0-macos-arm64.tar.gz"
      sha256 "f241b15d9ab87057e548721c1c26fce85e2659d16285219010d2fc42c193b763"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.14.0/syntaqlite-0.14.0-macos-x64.tar.gz"
      sha256 "b6747918c752bb12764ab19bf885ae2c19c6d830c99f82f5790e0cafabe2d490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.14.0/syntaqlite-0.14.0-linux-arm64.tar.gz"
      sha256 "9e099628b1656b5f0d6a98be9c305097e7c86f342efab03ae72730d1d6c3e2ed"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.14.0/syntaqlite-0.14.0-linux-x64.tar.gz"
      sha256 "59d6ede7aa2c3c76a984b04f1978f9c3b18dcc1659565f6c674bbe0343a00d55"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
