# typed: false
# frozen_string_literal: true

# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Orztinypng < Formula
  desc "This is a command-line tool for image compress of JPEG and PNG Using TinyPNG API"
  homepage "https://github.com/OrzGeeker/OrzTinyPNG"
  url "https://github.com/OrzGeeker/OrzTinyPNG/archive/refs/tags/0.0.4.tar.gz"
  sha256 "a68dabda6cd9a1854bcaf520002020ced023f25acb9dabbc8fc3442f9885706f"
  license "Unlicense"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release",
           "-Xswiftc", "--cross-module-optimization"
    mv ".build/release/tiny", "tiny"
    bin.install "tiny"
  end

  test do
    system "false"
  end
end
