class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.8/syntaqlite-macos-arm64.tar.gz"
      sha256 "7055faa1f1dd29363b7542ad07cf8ff667b7da7fb20b5e15c9c2aefc3b32cb66"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.8/syntaqlite-macos-x64.tar.gz"
      sha256 "796d3b361e3508cd4dff3c15b2396ddf9bf869f2624a9181940c13960949ef2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.8/syntaqlite-linux-arm64.tar.gz"
      sha256 "ff2eec3c029da5897c195903945cd92b57824414a08918099c9aa388d27be296"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.8/syntaqlite-linux-x64.tar.gz"
      sha256 "86498a1c4d22444099b0832a75f46a3062e0acd466a362f696b4c68b19c04942"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
