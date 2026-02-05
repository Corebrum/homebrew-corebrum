class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.202"









  def install
    binary = Dir["**/corebrum"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find corebrum binary" if binary.nil?
    bin.install binary
    
    # Install dist directory next to binary (for web UI)
    dist_dir = Dir["**/dist"].find { |f| File.directory?(f) }
    if dist_dir
      system "cp", "-r", dist_dir, "#{bin}/dist"
    end
  end
  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.202/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "598be5451a3a02e5b87bbfc032b7645d8c8ad4dc42bc8d252ca7ca1a1790b46f"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.202/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "fb5ba1373161d9714d1c81ff2263f4044afe80de4b29ba5f7eee4975acfe297a"
    end
  end
end