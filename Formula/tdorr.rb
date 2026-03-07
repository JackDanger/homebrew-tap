class Tdorr < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/tdorr"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.0/tdorr-macos-aarch64.tar.gz"
      sha256 "8e47bbe1d25b2459f59d70e2348d5785082adf45d954848d33513f5db99f0268"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.0/tdorr-macos-x86_64.tar.gz"
      sha256 "c7be36b405977b3e4821e0ce04749c94f4f3a82b603c31c88dda8c3e22f12dfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.0/tdorr-linux-aarch64.tar.gz"
      sha256 "6c05ed1576a19dc60e9457f0f2f4919dad111810e0becadda1764480073e7641"
    else
      url "https://github.com/JackDanger/tdorr/releases/download/v0.2.0/tdorr-linux-x86_64.tar.gz"
      sha256 "8ec8993c62c5f2f94d8d61128d2f2de97263f3e3a8eea936e3f227b865356db5"
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
