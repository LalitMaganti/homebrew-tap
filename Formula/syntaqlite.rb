class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.2.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.17/syntaqlite-macos-arm64.tar.gz"
      sha256 "891c3e4d9e2358af2bf09076f5ff5e4fc7ac5416d8c8e5da81b76258bf87695b"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.17/syntaqlite-macos-x64.tar.gz"
      sha256 "5722b15fd7073253de99529d167e5c134fea2f78939a06d7584d2d28f6d0b310"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.17/syntaqlite-linux-arm64.tar.gz"
      sha256 "01f258602616eccd8509f406cd80f84c2215223d3906cd7b20e6072cd441179e"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.2.17/syntaqlite-linux-x64.tar.gz"
      sha256 "7a5debbcc271f15b4ef03c203ff34d08c17b78045924cbc468a2e49fbe7b3c5d"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
