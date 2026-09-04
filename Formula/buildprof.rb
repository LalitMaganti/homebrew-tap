class Buildprof < Formula
  desc "Record Linux build processes and file access as a Perfetto trace"
  homepage "https://buildprof.lalitm.com"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.1/buildprof-aarch64-apple-darwin.tar.xz"
      sha256 "5b85d8f2ef10f0332da039ecab39fa77273b8dbeaaca0f0fffdb8867b24a017b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.1/buildprof-x86_64-apple-darwin.tar.xz"
      sha256 "9de329f1d7c2f68026196ce4727adc403e93cc6626bd55e827270cfb8d8cc2d8"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.1/buildprof-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "73ae7c6cd5c42b5f197efba57491df12174ead57e80ae9f6416413e5e1eda6c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.1/buildprof-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eb56392dc0347b6ff4aa75d888ba330b69dea427c411d2e2b145b9eb1268125a"
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
