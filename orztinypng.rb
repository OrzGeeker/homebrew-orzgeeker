# typed: false
# frozen_string_literal: true

# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Orztinypng < Formula
  desc "This is a command-line tool for image compress of JPEG and PNG Using TinyPNG API"
  homepage "https://github.com/OrzGeeker/OrzTinyPNG"
  url "https://github.com/OrzGeeker/OrzTinyPNG/archive/refs/tags/0.0.5.tar.gz"
  sha256 "67dbe6017edf3b0232578a9f95093146903e9df08db55279c152cf817ab35f65"
  license "Unlicense"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    mv ".build/release/tiny", "tiny"
    bin.install "tiny"
  end

  test do
    system "false"
  end
end
