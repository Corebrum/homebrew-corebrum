class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.218"











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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.218/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "a5e7a793cd315a8d10d87bd5a7556d02b598a82c2b78919f6c0f72fd3bc43955"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.218/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "8258a7bc9873b00948bfc96682b44da9f5e2b15a63394bb411caf9cf35e25ee8"
    end
  end
end