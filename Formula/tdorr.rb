class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v4.0.0/tdorr-macos-aarch64.tar.gz"
      sha256 "99c6a8ed364b731844dd575d1552566ae5456d30a07a9b9a4eade9f377e919fe"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v4.0.0/tdorr-macos-x86_64.tar.gz"
      sha256 "e4c7309168e2f135c2b9bd982cea99b7387f7458eb4a8c39922df07443e6cf8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v4.0.0/tdorr-linux-aarch64.tar.gz"
      sha256 "e7bf653281b4503011cce6e0d424b890b023864b5df81fe7a99ee1a958edc2cc"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v4.0.0/tdorr-linux-x86_64.tar.gz"
      sha256 "a3ee7027c1ada1b644e3bb7659c99214c9ad85e0ffa76ae1fe0aa6e4e8eacb78"
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
