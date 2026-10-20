class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.9"



















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.9/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "e32683895a92c918a00a42b5b0eb871fe5e5f75122cd159d53232db225cb996a"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.9/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "c0398772b10e57a469cbcd94900a956a2d0a0e5a83d3f4e7a4da9ffda3ccc99d"
    end
  end
end