class KnvAT00 < Formula
  desc "Keyboard-driven terminal UI for monitoring and operating Kubernetes nodes"
  homepage "https://github.com/kl2-in/nodeviewer"
  url "https://github.com/kl2-in/nodeviewer/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "f717d835ca0fb5703a8a9a73b2f26cf54e108a7be7af5428e790fd35a6fa777a"
  license "MIT"
  version "0.0.3"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"knv", "."
  end

  test do
    assert_match "knv", shell_output("#{bin}/knv -version")
  end
end
