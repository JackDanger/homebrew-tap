class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.5.0/tdorr-macos-aarch64.tar.gz"
      sha256 "5ac6c1642a52435cbb02d364ee154460ee05ead91c5d621e4a3b168425bb3f8a"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.5.0/tdorr-macos-x86_64.tar.gz"
      sha256 "91361d64807c29e89c67fd6758115bb267dfc9a98024840b3fd33f79b7610098"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.5.0/tdorr-linux-aarch64.tar.gz"
      sha256 "15b46dceddf2f22907dec790f05dc9d611f7484ae7e9bf1f93cb98ce61bceb2b"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.5.0/tdorr-linux-x86_64.tar.gz"
      sha256 "306508f6a31e1b8a8d8a3e4f75586d2387e3cd7a545b44421e33de6cb78dffde"
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
