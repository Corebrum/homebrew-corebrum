class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.1"
















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.1/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "21ee94adf051f873918d646b6d27ba423db387561647d6bb6d13af60ee7c150b"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.1/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "e498be2c30e0861c9f4890b0a5e6f3b3e747bd3791e3c614c12517b9061b5554"
    end
  end
end