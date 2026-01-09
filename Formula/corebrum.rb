# This is a template Homebrew formula for Corebrum
# Copy this to your homebrew-corebrum tap repository at Formula/corebrum.rb
# The GitHub Actions workflow will automatically update the version and checksums

class Corebrum < Formula
    desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
    homepage "https://github.com/corebrum/corebrum"
    license "All Rights Reserved"
  
        on_macos do
            if Hardware::CPU.intel?
                url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.132/corebrum-x86_64-apple-darwin.tar.xz"
                sha256 "ed71be5177e6d519dc64a4a42d1e167a01a879ec735e78fca5b9274fbe63ddd9"
            else
                url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.132/corebrum-aarch64-apple-darwin.tar.xz"
                sha256 "c84664f87362cf180fe362aef27b46745b6c6c7f75ac180bc721a04d9b0fa743"
            end
        end
  
    test do
      system "#{bin}/corebrum", "--version"
    end
  end
