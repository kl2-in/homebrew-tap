class Knv < Formula
  desc "Keyboard-driven terminal UI for monitoring and operating Kubernetes nodes"
  homepage "https://github.com/kl2-in/nodeviewer"
  url "https://github.com/kl2-in/nodeviewer/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "f05d3e72af2641fd2fd576914d520185a3ccb3b158d949e73bc092de4c60c691"
  license "MIT"
  version "0.0.2"

  head "https://github.com/kl2-in/nodeviewer.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags, "-o", bin/"knv", "."
  end

  test do
    assert_match "knv", shell_output("#{bin}/knv -version")
  end
end
