class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v1.0.0/isomage-macos-arm64.tar.gz"
      sha256 "b4cfbe7b8f1b8e0a94466d4b2dba36ca31f9efc22396dc54807f84346a984b08"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v1.0.0/isomage-macos-x86_64.tar.gz"
      sha256 "b14ed6d4b8b3d6b087f071cb4462ef67e305de2775901d6689a5e93713784290"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v1.0.0/isomage-linux-arm64.tar.gz"
      sha256 "4297389d548d166db837796d77c9af93ba8481e72e1b579ba69dd7f04b810815"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v1.0.0/isomage-linux-x86_64.tar.gz"
      sha256 "bc8ce4513bfd627e61df03a6d64a8e28018e55ef750538aa0d38d762133ccad5"
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
