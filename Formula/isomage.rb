class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.1.0/isomage-macos-arm64.tar.gz"
      sha256 "47d3f193b646c50df1577974af8d9baffacc69f21a49ad6dedd38fb2a5af917d"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.1.0/isomage-macos-x86_64.tar.gz"
      sha256 "07b9783acf9859d75243d94e105bae7d321534acda95feded1105b767b84c5ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.1.0/isomage-linux-arm64.tar.gz"
      sha256 "93babcc001e6a333bce6ff594007cbc3ea3b33c9558fa829b35d27460125b282"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.1.0/isomage-linux-x86_64.tar.gz"
      sha256 "ba2b011a2812bb9af2bba5660a4c3f2a45557e121add80415560babee3aa354e"
    end
  end

  def install
    Dir.glob("isomage-*").each do |f|
      bin.install f => "isomage"
    end
  end

  test do
    assert_match "isomage", shell_output("#{bin}/isomage --version")
  end
end
