# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Orztinypng < Formula
  desc "A command line tools for image compress of JPEG and PNG Using TinyPNG API"
  homepage "https://github.com/OrzGeeker/OrzTinyPNG"
  url "https://github.com/OrzGeeker/OrzTinyPNG/archive/refs/tags/0.0.2.tar.gz"
  sha256 "e8e2eb153dc5304b98ae40f10bf4c56e4314bfa5f2eb1c85b6bdbc478775cb6e"
  license "Unlicense"

  depends_on xcode: "13.3"
  uses_from_macos "swift"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "swift", "build", "--disable-sandbox", "--configuration", "release", \
    "-Xswiftc", "--cross-module-optimization"
    mv ".build/release/tiny", "tiny"
    bin.install "tiny"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test OrzTinyPNG`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
