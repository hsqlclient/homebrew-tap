class Hsqlclient < Formula
  desc "Client for HSQL"
  homepage "https://github.com/hsqlclient/hsqlclient"
  license "MIT"
  revision 1

  if Hardware::CPU.arm?
    url "https://github.com/hsqlclient/hsqlclient/releases/download/0.9.0/hsqlclient-darwin-arm64.tar.gz"
    sha256 ""
  else
    url "https://github.com/hsqlclient/hsqlclient/releases/download/0.9.0/hsqlclient-darwin-amd64.tar.gz"
    sha256 ""
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm" : "intel"
    system "env"

    bin.install "hsqlclient"
  end

  def post_install
    output = `env`
    puts output

    ohai "hsqlclient has been installed!\n"
    ohai "Usage: hsqlclient -h"
  end
end
