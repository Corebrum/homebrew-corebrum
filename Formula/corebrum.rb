class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.229"














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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.229/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "0fab69827e3bd7731174238a3d585f201d0701e30d3459828ff7c9a456bab758"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.229/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "7a8e40ad0e59c7291b5798b1ce6ad9325bc92017627207a0720ed855b2f8da05"
    end
  end
end