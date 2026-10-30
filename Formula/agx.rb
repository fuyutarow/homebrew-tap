class Agx < Formula
  version "1.22.39"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.39/agx-1.22.39-darwin-arm64.tar.gz"
      sha256 "74bcadcfb87cf0feec1fb93b6beec1b8d733eed7e57443c9a3c83d328d484a52"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.39/agx-1.22.39-darwin-x64.tar.gz"
      sha256 "0f3670dd2600a1a12eca7a00b2dc148d567621e72e406effee8f863a4842d906"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.39/agx-1.22.39-linux-arm64.tar.gz"
      sha256 "b80602f86bd64e0eb0d23a027c9b27cb2f4af2a3089bcd5a73c20af8766d3659"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.39/agx-1.22.39-linux-x64.tar.gz"
      sha256 "d02a7e8862616dca76056cbff116637c16bb082ed4f00f63bb424c980773443f"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
