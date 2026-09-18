class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v3.0.0/ctxgrd-v3.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "178e8e09732ffe01eee3b80e53403c579eb81b412da85a4bf8c3759d464aade4"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v3.0.0/ctxgrd-v3.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "5f77a90005d792d37b0e7cb2166fb11d7a669965f6f53df7366a1b55f60433ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v3.0.0/ctxgrd-v3.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f37eaa24e9a43a3a71ff8b97dc1b0aa64772db8366085541ab941de000f1474"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
