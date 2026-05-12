class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.3/hvac-macos-aarch64.tar.gz"
      sha256 "f6c2ca8c46a9cf175e818d19f16242ed33893e8175d909955261a0be893d2f91"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.3/hvac-macos-x86_64.tar.gz"
      sha256 "d60cbacf39d80313690bbe4f789719f25bee15c49322f06c23cc7adeb710d9db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.3/hvac-linux-aarch64.tar.gz"
      sha256 "991ee4c53fb6709fea25ed37e6c9f9103f28afadd9466bb94d513490d198febc"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.3/hvac-linux-x86_64.tar.gz"
      sha256 "fc5003943a99ba296e7ece0cc8820c919639f18a3eff4e33137c41ee3b0ad669"
    end
  end

  depends_on "ffmpeg"

  def install
    bin.install "hvac"
    etc.install "config.yaml" => "hvac/config.yaml"
  end

  def caveats
    <<~EOS
      hvac requires a GPU with hardware HEVC encoding:
        macOS:  Apple VideoToolbox (built into all Apple Silicon and recent Intel Macs)
        Linux:  NVIDIA NVENC (hevc_nvenc) or Intel/AMD VAAPI (hevc_vaapi)

      A starter config was installed to:
        #{etc}/hvac/config.yaml

      Run `hvac --dry-run /path/to/videos` to preview what would be transcoded.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hvac --version")
  end
end
