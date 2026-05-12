class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.2/hvac-macos-aarch64.tar.gz"
      sha256 "ba649e266a0d9b011878afb593758e9612996086799c01ec1a46393276dba873"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.2/hvac-macos-x86_64.tar.gz"
      sha256 "98e6928f4e47ebeb64bf3b4713809e76c40c2d55bbb6bb34664875e861e386c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.2/hvac-linux-aarch64.tar.gz"
      sha256 "14a141b7c00525d3654c1bb6aa1ca0622cb450635bf727c1ac0d29427e0b2776"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.2/hvac-linux-x86_64.tar.gz"
      sha256 "9e9f6e2f3782606d59748ece64b42d5e80eb463b61d8e142fb3efaa81a838d53"
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
