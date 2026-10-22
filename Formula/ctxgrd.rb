class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.11.1/ctxgrd-v5.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "1bf1285cfcb0630b0fe30104fc9fbb6d439013dd92deac359dd0344586130153"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.11.1/ctxgrd-v5.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "b4fe3538e1d067e8ab7890b77f7394bffd705254bfc1f4a01cf54229d02d9f1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v5.11.1/ctxgrd-v5.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4418c3138904c825c023c8358b6f6d7695598bb1f354e3c68fc56d0f92d7a844"
    end
  end

  def install
    bin.install "ctxgrd"
  end

  test do
    assert_match "ctxgrd #{version}", shell_output("#{bin}/ctxgrd --version")
  end
end
