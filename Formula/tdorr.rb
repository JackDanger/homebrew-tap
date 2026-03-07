class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.3.0/tdorr-macos-aarch64.tar.gz"
      sha256 "628b500a029798f6c270f9f9e9620420b4bd249da5ef39cb7ecc5d3352e08cb5"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.3.0/tdorr-macos-x86_64.tar.gz"
      sha256 "2742d81fc900b98eb0fdd3ac3ea59a3bc26162db8500bd73ec42ae5f22bc57f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.3.0/tdorr-linux-aarch64.tar.gz"
      sha256 "c2232a5e91899a9f39558a394312214f7ef8dc35213c211cf12de3170f4c8b17"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.3.0/tdorr-linux-x86_64.tar.gz"
      sha256 "c8c4c6c45bc34dda695229aac7bb6d7d9c2c39c2c8e7a37bd2b77681432a3268"
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
