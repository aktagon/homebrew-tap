class Aigrd < Formula
  desc "LLM-judged rubric gate for agent output"
  homepage "https://github.com/aktagon/aigrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/aigrd/releases/download/v0.4.0/aigrd-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "50b8ea96dc8c00262b7b54b7b56d7de36e6a0c3d9739d3628026872eb995d1df"
    end
    on_intel do
      url "https://github.com/aktagon/aigrd/releases/download/v0.4.0/aigrd-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "73111f2f6cf1a9f93a8fc68b7f62d8321859be11d4f800c0c2c09d9257fe79ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/aigrd/releases/download/v0.4.0/aigrd-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c079f626c6f2b77fa6a25c565640283e62ea8dd1affab236c3e7a1dd6f407ee"
    end
  end

  def install
    bin.install "aigrd"
  end

  test do
    assert_match "aigrd #{version}", shell_output("#{bin}/aigrd --version")
  end
end
