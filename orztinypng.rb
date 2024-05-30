# typed: false
# frozen_string_literal: true

# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Orztinypng < Formula
  desc "This is a command-line tool for image compress of JPEG and PNG Using TinyPNG API"
  homepage "https://github.com/OrzGeeker/OrzTinyPNG"
  url "https://github.com/OrzGeeker/OrzTinyPNG/archive/refs/tags/0.0.6.tar.gz"
  sha256 "d553d7cc96d2e91e33b474ab443d4fc19bc4257f87b54fe4ca7114ac7c05e667"
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
