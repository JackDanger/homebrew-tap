class Isomage < Formula
  desc "Browse and extract files from ISO images without mounting them"
  homepage "https://github.com/JackDanger/isomage"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.3.0/isomage-macos-arm64.tar.gz"
      sha256 "e477436015e3c19c45b780dba7534eb82a129e7c542346fef3d65ee7a03f0d34"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.3.0/isomage-macos-x86_64.tar.gz"
      sha256 "bd2beae14e0ba592a173d811894a2cc5fe1cf6eb314d93d37918fd5c13d9475c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/JackDanger/isomage/releases/download/v0.3.0/isomage-linux-arm64.tar.gz"
      sha256 "1ff08ca09877ce5a8cfdadbf3f57de7a7131f6920557607f0890130e4d6dab74"
    else
      url "https://github.com/JackDanger/isomage/releases/download/v0.3.0/isomage-linux-x86_64.tar.gz"
      sha256 "118abdc72cbd433c8b42e24fbbcfe8a959ce24d0b428f8c4153bdfe3ef18febb"
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
