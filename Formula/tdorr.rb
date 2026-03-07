class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-macos-aarch64.tar.gz"
      sha256 "6b9ba095b79fd7ab6d91f499c2b312682f6d48e0619c7216111dd63af8149600"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-macos-x86_64.tar.gz"
      sha256 "f1ff7769bc7aaa663cc6becf40989667e03e35f36551721792107979e8951abb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-linux-aarch64.tar.gz"
      sha256 "2b8935b318c6b416fcc6cb44507b95f0cba169731b51c7a51e8d306061c172e9"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-linux-x86_64.tar.gz"
      sha256 "f523a92fad334f9940b91575e61447567f2455712d6977025c797e73ec9aa08c"
    end
  end

  depends_on "ffmpeg"

  def install
    bin.install "tdorr"
  end

  test do
    assert_match "GPU-accelerated", shell_output("#{bin}/tdorr --help", 2)
  end
end
