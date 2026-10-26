class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.13.0/ctxgrd-v5.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "296d99a83cf50a691d67c06203b2c8e80d205ac12e7302f3cbb8189b3721bcaf"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.13.0/ctxgrd-v5.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "89c515c430bf03fe7888b30e4403fc685c66e3a1c40bffbc74d6e1aab1356405"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.13.0/ctxgrd-v5.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ce69384337aa3060314ecf8c9ccb1747f05eec891ca8ed1e7ce3336316f3fde"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
