class Cortex < Formula
  desc "Corebrum Cortex - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/Corebrum/corebrum-cortex"
  license "All Rights Reserved"
  version "0.3.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.14/cortex-x86_64-apple-darwin.tar.xz"
      sha256 "1ac0a699a757687df3c9a57e8f09517acf61d8905895d4522f712ebcd5572c38"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.14/cortex-aarch64-apple-darwin.tar.xz"
      sha256 "003f15ecaf393de3a3e7ec41c254ce6176f0bbb12197b3f020d7817fd40f5552"
    end
  end

  test do
    system "#{bin}/cortex", "--version"
  end

  def install
    binary = Dir["**/cortex"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find cortex binary" if binary.nil?
    bin.install binary
    
    # Install dist directory to share (Homebrew convention, for web UI)
    dist_dir = Dir["**/dist"].find { |f| File.directory?(f) }
    if dist_dir
      (share/"cortex").install dist_dir
    end
  end
end
