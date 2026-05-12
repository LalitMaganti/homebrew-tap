class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.9/syntaqlite-macos-arm64.tar.gz"
      sha256 "760416147c489b2b9a04a1ad98e4e94b429d6682f4c45a48611d9571039e1718"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.9/syntaqlite-macos-x64.tar.gz"
      sha256 "efa2ebffc333584067865f5c7efb86053d0ad47494dc4b6ef21c65f802d17b94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.9/syntaqlite-linux-arm64.tar.gz"
      sha256 "c43b8d813f23b752ed87f95de6afaa3ca7d3113c418e7f96099c08ec439a1e24"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.9/syntaqlite-linux-x64.tar.gz"
      sha256 "7f4f290ee3c7d167118eb81a0da85fcddc0bd45c0de502f401e15d67f95c5da0"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
