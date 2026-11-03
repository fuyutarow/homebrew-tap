class Agx < Formula
  version "1.22.73"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.73/agx-1.22.73-darwin-arm64.tar.gz"
      sha256 "5133ff924adc02f4bffed977ce60de04ea69d80a9cc4a8179b5f6ba25482318e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.73/agx-1.22.73-darwin-x64.tar.gz"
      sha256 "980530ae6a030fb30b554e3fa1cd561db0fd6f02daecd0dec91cc5e6b2e2f2fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.73/agx-1.22.73-linux-arm64.tar.gz"
      sha256 "6c0250dc266731b8aaf7dd32fccad93683c09d97784846278ad49a14381a703c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.73/agx-1.22.73-linux-x64.tar.gz"
      sha256 "0a3275ca705a38941873cb4ecdc308e5f279fc4f58bd1ab772d62c7ef3ea783c"
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
