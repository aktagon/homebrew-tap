class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.2.0/ctxgrd-v6.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9b8892b703c7e54d0b90da18e730bde28dd1ace26bd3dacd245720aec987b71a"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.2.0/ctxgrd-v6.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "96405614827b333bd722c47621a74f9d646c2701c15f3e59834f381f8785bf4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.14.0/ctxgrd-v5.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "631e69822122f44878c7aba817a0ac39870fe9e40ba87d77a49687fbc0d5cf02"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
