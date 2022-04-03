
# typed: false
# frozen_string_literal: true

# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Orzswiftmc < Formula
  desc "This is a command-line tool for deploy minecraft server or launch client"
  homepage ""
  url "https://github.com/OrzGeeker/OrzSwiftMC/archive/refs/tags/0.0.1.tar.gz"
  sha256 "478fc4e05865cbf28f5574113b34ef0b60c5cb0f51384a4daffc9b720cb36845"
  license "Unlicense"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    mv ".build/release/orzmc", "orzswiftmc"
    bin.install "orzswiftmc"
  end

  test do
    system "swift", "test"
  end
end
