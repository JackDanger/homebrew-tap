class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.2/hvac-macos-aarch64.tar.gz"
      sha256 "186a73f22f4257dcd08381693f07664df12a4b7aec3d52ec40912c317b852bb9"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.2/hvac-macos-x86_64.tar.gz"
      sha256 "a1df278ec3709733a49a2dd0fc89d98bea12ea148062f5d56507d186d92a910d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.2/hvac-linux-aarch64.tar.gz"
      sha256 "bb81a7f7689cd37044df78ea3a34d391732d3ce34a8e45b7c9ef8d499c0af8d5"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.2/hvac-linux-x86_64.tar.gz"
      sha256 "85f10f34761bac4383a6fe82b01706adff55bea7440b47a4b040f64051567ac2"
    end
  end

  depends_on "ffmpeg"

  def install
    bin.install "hvac"
    (etc/"hvac").install "config.yaml"
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
