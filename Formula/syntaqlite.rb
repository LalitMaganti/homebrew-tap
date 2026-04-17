class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.2/syntaqlite-macos-arm64.tar.gz"
      sha256 "9fd04c6d61e6bc6d71d1a5c7b36817976529ca717db2c807c133c7970cb2490a"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.2/syntaqlite-macos-x64.tar.gz"
      sha256 "ab0dc626c6237f55985ea1940884d0951dea4bc7247b5000b28e6c3537153db3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.2/syntaqlite-linux-arm64.tar.gz"
      sha256 "8fac0a8c7a31a00178eae3dccbbb1ebf203b77c63b12ec3318699e04be1b2aba"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.4.2/syntaqlite-linux-x64.tar.gz"
      sha256 "ef82d338c94d9494354a2d995675745feb15d2ad84ee47d83dc99e3f06203e68"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
