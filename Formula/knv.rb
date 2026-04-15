class Knv < Formula
  desc "Keyboard-driven terminal UI for monitoring and operating Kubernetes nodes"
  homepage "https://github.com/kl2-in/nodeviewer"
  license "MIT"
  url "https://github.com/kl2-in/nodeviewer/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "a9e365415cb2c5c1c1333659df4934562cc9a6c767026eaee5b3b39362a69c75"
  version "0.0.2"

  head "https://github.com/kl2-in/nodeviewer.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"knv", "."
  end

  test do
    assert_match "non-TUI output mode", shell_output("#{bin}/knv -h 2>&1")
  end
end
