class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.4.1/ctxgrd-v6.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "218a5cc9684ef00b8eadac9c6a9b48cd91c433ed183f38fe5f8a864e157b9f0d"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.4.1/ctxgrd-v6.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "f5cad321c0b739191b9914e96cd541cbffbe78753db7725c99b2964f9ca71039"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.4.1/ctxgrd-v6.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca747ed891f61404b9b9ea7623f4a2ec1d22e47525a82ba0c0617aff2f211802"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
