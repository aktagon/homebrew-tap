class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.9.0/ctxgrd-v5.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "a1aa396b282b29ec98239e8e84b34dd28a0717a941fbd4c1e4d85048850ec7f9"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.9.0/ctxgrd-v5.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "5360c1fe4fea96fe27bc1d8220b745982c5250f0f733c711fa7522dff29b7454"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.9.0/ctxgrd-v5.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "246f7b0be03f928056e341de571bea66f47f19576fa6b7914d0d93d998b5b315"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
