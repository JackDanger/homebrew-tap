class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.1/tdorr-macos-aarch64.tar.gz"
      sha256 "690272ad4d3c51606497614d0951d15db0ccfaffcf21a880203a07b2c0a1e48a"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.1/tdorr-macos-x86_64.tar.gz"
      sha256 "e2b6e86bab6eae90366d3d408a9bd412dfdd2263722010df5a590e761c1f15e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.1/tdorr-linux-aarch64.tar.gz"
      sha256 "ca78e1a5848b204f31d54b550310462c5630d24aa92a91cbf80a5c957705ee94"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.1/tdorr-linux-x86_64.tar.gz"
      sha256 "508aa38099b51b377850150a571fb739eddc20e64926b942c55758a4f78eb588"
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
