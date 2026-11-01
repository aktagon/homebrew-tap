class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.0.0/ctxgrd-v6.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "92398b346389b29f197ec4304fdaa3db6e18fae56c7f4cb4cf31d7753fe1f584"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.0.0/ctxgrd-v6.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "5d9f261101cb815324835ba0d6db31df218fa06c3cf508e1d4274a0b96207ad2"
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
