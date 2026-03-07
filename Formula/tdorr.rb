class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-macos-aarch64.tar.gz"
      sha256 "087d00b51154f79b7c2f1d155e2912d352376f1ddbb97a91283119f85fca32fb"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-macos-x86_64.tar.gz"
      sha256 "2ce8e4c0a5a07c17718688f1c650df1d5ca0b8063bcbe0cdbcf5a9c9396f3559"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-linux-aarch64.tar.gz"
      sha256 "abc93568569875db8bd1f7b9bfe321b57b12a9524696248c39ea3c835433683f"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.4.0/tdorr-linux-x86_64.tar.gz"
      sha256 "c7030edff7bf0aca34b34cdb417aaf3063063c769544b469c4fb7aa98a317aaa"
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
