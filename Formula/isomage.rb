class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/latest/download/isomage-macos-arm64.tar.gz"
    else
      url "https://github.com/JackDanger/isomage/releases/latest/download/isomage-macos-x86_64.tar.gz"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/latest/download/isomage-linux-arm64.tar.gz"
    else
      url "https://github.com/JackDanger/isomage/releases/latest/download/isomage-linux-x86_64.tar.gz"
    end
  end

  def install
    # The tarball contains a single binary named isomage-<platform>-<arch>
    Dir.glob("isomage-*").each do |f|
      bin.install f => "isomage"
    end
  end

  test do
    assert_match "isomage", shell_output("#{bin}/isomage --version")
  end
end
