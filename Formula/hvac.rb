class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.0/hvac-macos-aarch64.tar.gz"
      sha256 "3d1f6e0d3afd8356598218fe764eb6052349505e79b2d434ffbf6e840bee8254"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.0/hvac-macos-x86_64.tar.gz"
      sha256 "df0f48154d7dcb0237682323bf94bc6fc2d2961c2eb51e0d660c6092ed71ca4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.0/hvac-linux-aarch64.tar.gz"
      sha256 "3f20831761092a887fae2d752f76975594b5ac0b392bf62ba7f2c04aa2b8b63b"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.4.0/hvac-linux-x86_64.tar.gz"
      sha256 "d2e17d493d686e797a530b9124511a330e91b78948759e8e6521b21716c4fc4d"
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
