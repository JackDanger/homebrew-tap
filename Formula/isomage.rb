class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.2.0/isomage-macos-arm64.tar.gz"
      sha256 "f43a11fabc339fffe97944f46e8aaf581f4a1bd2594ef4219629a3730aaa8889"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.2.0/isomage-macos-x86_64.tar.gz"
      sha256 "f9a4714215f235c2a38b5dc5974175d714bf282fee8042921ccd1fb59f687b6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.2.0/isomage-linux-arm64.tar.gz"
      sha256 "3a38abfbf5d6f0b0b77582ee921776f24f26c9316706ce64c301e50c3558dfad"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.2.0/isomage-linux-x86_64.tar.gz"
      sha256 "336ba933995f5964bd7acee42c9940313a1398f351d850a3808cd1ba4c8611fb"
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
