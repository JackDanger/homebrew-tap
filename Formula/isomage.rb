class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.4.0/isomage-macos-arm64.tar.gz"
      sha256 "67895e295e45214eaadbea7f79cdcdb96c4b17d21e3bdb9d5df2a5c898ad6514"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.4.0/isomage-macos-x86_64.tar.gz"
      sha256 "143d52a09e911a2556c463ea79c570e9cf113e11d2af58bc64726dc70a270484"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.4.0/isomage-linux-arm64.tar.gz"
      sha256 "6c57efa724da45000bfc56a3e58ee2200e1425517c171ef489e8be821ba37340"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.4.0/isomage-linux-x86_64.tar.gz"
      sha256 "6a7abbca817e82fd66af554b38c5a45f52f97418c066a77134982d35b1d72786"
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
