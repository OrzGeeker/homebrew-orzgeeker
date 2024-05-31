# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Objectcreate3d < Formula
  desc "3D对象重建命令行工具"
  homepage ""
  url "https://github.com/wangzhizhou/OrzSpatialComputing/archive/refs/tags/0.0.2.tar.gz"
  sha256 "5709894bdb1732200ced15b51bb3485a83fe0a7e60516e4b0bd50d2a28fa62e4"
  license "MIT"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    mv ".build/release/3DCreate", "3DCreate"
    bin.install "3DCreate"
  end

  test do
    system "false"
  end
end
