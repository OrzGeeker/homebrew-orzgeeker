# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Orztinypng < Formula
  desc "A command line tools for image compress of JPEG and PNG Using TinyPNG API"
  homepage "https://github.com/OrzGeeker/OrzTinyPNG"
  url "https://github.com/OrzGeeker/OrzTinyPNG/archive/refs/tags/0.0.3.tar.gz"
  sha256 "f1466a4368375a6c4b94c2d96616ee90221f2d176ef27113ad97ea4273d9db93"
  license "Unlicense"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release", \
    "-Xswiftc", "--cross-module-optimization"
    mv ".build/release/tiny", "tiny"
    bin.install "tiny"
  end

  test do
    system "false"
  end
end
