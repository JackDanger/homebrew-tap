class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.1/hvac-macos-aarch64.tar.gz"
      sha256 "766a5bb545e4e28c5936d382ace753e3792babf48381214232f7d0c7570099fc"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.1/hvac-macos-x86_64.tar.gz"
      sha256 "8d5cb5ea4c6983ecfdcfe5cae4050460f3eb4e9e78849febb9cd3f8491abed7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.1/hvac-linux-aarch64.tar.gz"
      sha256 "2f298464b1d2c121287f5442b9cc54f4062a112015fdaa3e77446929aef11275"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.1/hvac-linux-x86_64.tar.gz"
      sha256 "f1d074ef44050ff6027a5221f5bda5d51ff45ecee70551360369ed9a8047a184"
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
