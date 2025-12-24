# This is a template Homebrew formula for Corebrum
# Copy this to your homebrew-corebrum tap repository at Formula/corebrum.rb
# The GitHub Actions workflow will automatically update the version and checksums

class Corebrum < Formula
    desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
    homepage "https://github.com/corebrum/corebrum"
    license "All Rights Reserved"
  
    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/corebrum/corebrum/releases/download/v0.2.73/corebrum-x86_64-apple-darwin.tar.xz"
        sha256 "PLACEHOLDER_INTEL_SHA256"
      else
        url "https://github.com/corebrum/corebrum/releases/download/v0.2.73/corebrum-aarch64-apple-darwin.tar.xz"
        sha256 "PLACEHOLDER_ARM_SHA256"
      end
    end
  
    def install
      bin.install "corebrum"
    end
  
    test do
      system "#{bin}/corebrum", "--version"
    end
  end
  
  