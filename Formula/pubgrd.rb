class Pubgrd < Formula
  desc "Copy a public repository tree from a private one and verify nothing leaked"
  homepage "https://github.com/aktagon/pubgrd"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/pubgrd/releases/download/v0.2.0/pubgrd-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2a0dda0a25b7289d64320a6e8694d4f3a5f2a7adc4762fb825dec641adfe3075"
    end
    on_intel do
      url "https://github.com/aktagon/pubgrd/releases/download/v0.2.0/pubgrd-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "32e5ad219a783f41d8bc1c18504cc22c3dc81513e3ec8b722de972df9b4a72a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/pubgrd/releases/download/v0.2.0/pubgrd-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a6c77c081c1982feacda7da0473b4da2f9426434bbac049613562f231cee898"
    end
  end

  def install
    bin.install "pubgrd"
  end

  test do
    assert_match "pubgrd", shell_output("#{bin}/pubgrd --version")
  end
end
