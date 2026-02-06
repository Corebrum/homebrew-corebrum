class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.220"












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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.220/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "2eabf243fe804a2ad6ec36abe57a6019252c247ada1d6e2906882029ba85ea12"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.220/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "94d1d7c29c88db6f53694f2a999def131caaad858bf4b2f508148fc7316aef8b"
    end
  end
end