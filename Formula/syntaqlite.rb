class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.0/syntaqlite-macos-arm64.tar.gz"
      sha256 "0d66cf839bf17d67af2e8dd7f6fff1ceb3d512b95c5a85f25f85b9c07e3846bc"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.0/syntaqlite-macos-x64.tar.gz"
      sha256 "14d5a6058f7381d2c8803902d92a93aad0588eabd95c6f978afe892819867087"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.0/syntaqlite-linux-arm64.tar.gz"
      sha256 "9364187ef9787edbc95f1c9c98a46b72a6959f774087680080bab49864d87c06"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.12.0/syntaqlite-linux-x64.tar.gz"
      sha256 "008d09a0d308ab02621a6e1dc36dbb378cf33b24e4bfa90c3189b7898fcd493c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
