class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.11.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.2/syntaqlite-macos-arm64.tar.gz"
      sha256 "5db6c65bed3b9f617c617b2af8ce4a2440aa40aae6ef48fe804ca69bff1fc094"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.2/syntaqlite-macos-x64.tar.gz"
      sha256 "65c0be39787ba8af223abff5f79baa8fa7acbf34cc7f958791ebf200f56ed57f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.2/syntaqlite-linux-arm64.tar.gz"
      sha256 "c16e9099da38546d89174db940cf3444805c9817f0b7b9b34e13e5159bb3bbd7"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.2/syntaqlite-linux-x64.tar.gz"
      sha256 "60328dd9fb7222b19c752e8986f6eae32fc0c628de7a62c8580dfeb79b8e79bd"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
