class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "4.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v4.1.0/tdorr-macos-aarch64.tar.gz"
      sha256 "9ee69049516fec757dd5dd1f4a3408661df9a96dc4d788bc21ef6177688fac83"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v4.1.0/tdorr-macos-x86_64.tar.gz"
      sha256 "1a2c0ce3dde8829c05f7c1d3623e1a07337879105e8e186fb60b12277ca73f2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v4.1.0/tdorr-linux-aarch64.tar.gz"
      sha256 "efd29e4db87f974bdf21412522dc4d51f0353ee6dcb78f99ff2198a1c5632320"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v4.1.0/tdorr-linux-x86_64.tar.gz"
      sha256 "795623a5a08ff10b53936acdfe38ae80a19f03ecceef5ade29bb10eefbb67191"
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
