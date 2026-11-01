class Ctxgrd < Formula
  desc "Lint your context: ADR, PRD, SPEC, HANDOFF and README structure"
  homepage "https://github.com/aktagon/ctxgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.1.0/ctxgrd-v6.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "20bf87ce4c7b2beea7f90b534063ea85d1b11cb4fbdef0b278ccab8aebdfc1fd"
    end
    on_intel do
      url "https://github.com/aktagon/ctxgrd/releases/download/v6.1.0/ctxgrd-v6.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "71cae4da60caa4d90f2804d900ef31f3d8e9c512ba0706b69a525c06c42f7b05"
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
