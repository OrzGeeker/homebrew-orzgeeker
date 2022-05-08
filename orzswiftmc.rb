
# typed: false
# frozen_string_literal: true

# https://docs.brew.sh/Formula-Cookbook
# https://rubydoc.brew.sh/Formula
class Orzswiftmc < Formula
  desc "This is a command-line tool for deploy minecraft server or launch client"
  homepage ""
  url "https://github.com/OrzGeeker/OrzSwiftMC/archive/refs/tags/0.0.2.tar.gz"
  sha256 "1142cc7169d6e99caace51864fc5a52ebc7cb3865e4d25c8b7f776223022d0e8"
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
