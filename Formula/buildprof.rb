class Buildprof < Formula
  desc "Records every process and file access in a build and shows it as an interactive timeline"
  homepage "https://buildprof.lalitm.com"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.4/buildprof-aarch64-apple-darwin.tar.xz"
      sha256 "44a1c053376b8f2385aa41012e5537a1f77615ab1c60b8e9e232d9a0d729726f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.4/buildprof-x86_64-apple-darwin.tar.xz"
      sha256 "fdff4796385615e7eb2f8ba5f471b35eb25988c4ad88d1de341f688bdffe9b6f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.4/buildprof-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "73ad28fe505036c9b35327abe4577830273aeeb4de7b00d040ea95254dbd9dfe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.4/buildprof-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c3be7b25e4549f0e10334c610289490e9267871300afedfdc5931dcf5989ae8b"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "buildprof"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "buildprof"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "buildprof"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "buildprof"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
