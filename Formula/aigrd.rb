class Aigrd < Formula
  desc "LLM-judged rubric gate for agent output"
  homepage "https://github.com/aktagon/aigrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/aigrd/releases/download/v0.3.1/aigrd-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "9f9ed6cf4717ec5e6fc187c27004eeef90a29fd835f7a596f3746304668c4355"
    end
    on_intel do
      url "https://github.com/aktagon/aigrd/releases/download/v0.3.1/aigrd-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "aaf0f3182a1446cc27b90ddf13c4009e6ae4370b5331f64f2ff7b3cf179c7da2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/aigrd/releases/download/v0.3.1/aigrd-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af35cee0bf54e1ed900d2d985e226b6fe04b364bb8bfe32d7b807513ba651ad0"
    end
  end

  def install
    bin.install "aigrd"
  end

  test do
    assert_match "aigrd #{version}", shell_output("#{bin}/aigrd --version")
  end
end
