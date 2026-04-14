class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "5.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v5.1.1/tdorr-macos-aarch64.tar.gz"
      sha256 "9cc8c617e1a3a2d5e4f6b351c27d687808a29354c3657a68d411ecc4095c7b68"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v5.1.1/tdorr-macos-x86_64.tar.gz"
      sha256 "1d8514a85355013dd14807ddc217a78cc92b9c10b878558d4772d1069dcff2a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v5.1.1/tdorr-linux-aarch64.tar.gz"
      sha256 "13d42d904c17f25d357aefb4b5fdf35ee15c2c59bb63298d9d2aad1a2f231eb5"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v5.1.1/tdorr-linux-x86_64.tar.gz"
      sha256 "0d86dc5a9bf294c23758ccb918bd35858aed91f12618007e7b7ac97ec03f8152"
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
