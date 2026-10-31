class Agx < Formula
  version "1.22.51"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.51/agx-1.22.51-darwin-arm64.tar.gz"
      sha256 "e9ed31d13fb57962b1eb639efd044a0dde3edd5caa8beb77954abb0457075802"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.51/agx-1.22.51-darwin-x64.tar.gz"
      sha256 "5e40e1c2f16cc1d99e65a13c22eb0d066cb7973128d444d8bd3ff44969052030"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.51/agx-1.22.51-linux-arm64.tar.gz"
      sha256 "bbfb20104cf3341724e1a31f8adcb7b95c254ed75c1559464aba465172d1e2fd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.51/agx-1.22.51-linux-x64.tar.gz"
      sha256 "494fc87acf97e2759b4fe06f73a86e68323c1fa003f16886a00f170e930a7fe2"
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
