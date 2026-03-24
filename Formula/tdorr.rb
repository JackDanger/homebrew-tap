class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "5.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v5.0.0/tdorr-macos-aarch64.tar.gz"
      sha256 "635d5014ea540a33a9027d26b8dfc74c347c2b7473740d24e08ceffbb9b425db"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v5.0.0/tdorr-macos-x86_64.tar.gz"
      sha256 "6c6dcead5d14d25223fc8c4552bfb580935a7bbf0c48a876e29e9efe555db4f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v5.0.0/tdorr-linux-aarch64.tar.gz"
      sha256 "8ac771eb44b9742bd33ab03d553c52eacbdab73d8068b6c3dcb1d9f432532344"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v5.0.0/tdorr-linux-x86_64.tar.gz"
      sha256 "a92c917cd26a9e9c7ba588fdc3e74c70ef27e4c7a3076f51dfed7d2e73505448"
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
