class Hvac < Formula
  desc "GPU-accelerated media transcoder (HEVC/h265 via NVENC, VAAPI, VideoToolbox)"
  homepage "https://github.com/JackDanger/hvac"
  version "5.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.5/hvac-macos-aarch64.tar.gz"
      sha256 "52121fae1cf4140eeb774f2c223ae1b1a0a8921810ba84e16e6117eb7684609c"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.5/hvac-macos-x86_64.tar.gz"
      sha256 "bc161b0f0dbacde79c3c61163fc02341541cebeaa439e8bca59e0ccbf4b2870c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.5/hvac-linux-aarch64.tar.gz"
      sha256 "edeb7540a4e70ccd08a4073b8e0574ac90e5b1433cc23e9a615474ca71bf3b4a"
    else
      url "https://github.com/JackDanger/hvac/releases/download/v5.2.5/hvac-linux-x86_64.tar.gz"
      sha256 "90370fd64e4d2d97c2631114d7e74124acfc75f0eceebf3fc9380a84dd576825"
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
