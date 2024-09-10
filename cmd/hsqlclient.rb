class Hsqlclient < Formula
  desc "Client for HSQL"
  homepage "https://github.com/hsqlclient/hsqlclient"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/hsqlclient/hsqlclient/releases/download/0.9.0/hsqlclient-darwin-arm64.tar.gz"
    sha256 ""
  else
    url "https://github.com/hsqlclient/hsqlclient/releases/download/0.9.0/hsqlclient-darwin-amd64.tar.gz"
    sha256 ""
  end

  def install
    bin.install "hsqlclient"
  end
end
