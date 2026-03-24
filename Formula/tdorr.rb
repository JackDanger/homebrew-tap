class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.6.0/tdorr-macos-aarch64.tar.gz"
      sha256 "a915e04dc60bcc3268acbb72e85846c74a41787c45453070b13c24cac4f1992d"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.6.0/tdorr-macos-x86_64.tar.gz"
      sha256 "ed24edb30e066c9908f2b64c0da03aef5ee5a7de3dd5a509f717e1ea96ead115"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.6.0/tdorr-linux-aarch64.tar.gz"
      sha256 "09badbc61e5f223d4d1bc1b5c212e991d1532de91c6ccb48705e0c2dd5943513"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.6.0/tdorr-linux-x86_64.tar.gz"
      sha256 "33e036aa96f705ecea15fa0752509f96aa06efac30f510005dc8a00cb341e11d"
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
