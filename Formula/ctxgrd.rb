class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.14.0/ctxgrd-v5.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1ec55be9921795b095f2787420309db926f9e42b8e407b982ec269960886cd1"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.14.0/ctxgrd-v5.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "e15ae977084c8301c6810ea31947608aa7bce9bc35e72b1541f5f3f673138ee2"
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
