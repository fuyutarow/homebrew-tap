class Agx < Formula
  version "1.22.16"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.16/agx-1.22.16-darwin-arm64.tar.gz"
      sha256 "b9c4d9632c9e5a44f99e412d65d8aff6fef500ef648664ce358282f55098af2e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.16/agx-1.22.16-darwin-x64.tar.gz"
      sha256 "0f0c7c37f505d9b4338e5201e15610efb5cf7e00b6e70ac90c220614bde86b33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.16/agx-1.22.16-linux-arm64.tar.gz"
      sha256 "cda513db83995737be2a3cadd2171562450641cf51746cb322ed26a1ba41373e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.16/agx-1.22.16-linux-x64.tar.gz"
      sha256 "215d6418cb7809036ce466f5bbe01d3acf381f6c38d1825531b141ff32539d9d"
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
