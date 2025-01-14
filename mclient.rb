class Mclient < Formula
  desc "Cli client for memcache server and other derivatives"
  homepage "https://github.com/lovelock/mclient"
  sha256 "d0f6a5fada4a62a908a497479fcdd116632a9b66"
  head "https://github.com/lovelock/mclient.git"

  def install
    # Per https://luajit.org/install.html: If MACOSX_DEPLOYMENT_TARGET
    # is not set then it's forced to 10.4, which breaks compile on Mojave.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
    system "go build"
    bin.install "mclient"
  end

  test do
    system *%W[#{bin}/wrk2 -r 5 -c 1 -t 1 -d 1 https://example.com/]
  end
end
