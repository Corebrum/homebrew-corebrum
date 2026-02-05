class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.199"








  def install
    binary = Dir["**/corebrum"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find corebrum binary" if binary.nil?
    bin.install binary
  end
  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.199/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "5798fb81815951a78214840a75993b55a22cd780688700479007af8ac80da16b"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.199/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "26d5115d2f9bdc381a65b0ebc0a60438644a8f0fbdd015ab8a123a8320f0005f"
    end
  end
end