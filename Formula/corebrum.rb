class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.11"





















  def install
    binary = Dir["**/corebrum"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find corebrum binary" if binary.nil?
    bin.install binary
    
    # Install dist directory to share (Homebrew convention, for web UI)
    dist_dir = Dir["**/dist"].find { |f| File.directory?(f) }
    if dist_dir
      (share/"corebrum").install dist_dir
    end
  end
  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.11/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "32d89ae55b43baf3c1c10d104e9412950a7f68d128f6b851835585418fdf21a0"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.11/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "4daff708a68fc4790f974482e0279892f9dd4bdd3074d2c10757cb2854e7a0f9"
    end
  end
end