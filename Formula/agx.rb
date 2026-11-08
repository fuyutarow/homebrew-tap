class Agx < Formula
  version "7.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v7.0.0/agx-7.0.0-darwin-arm64.tar.gz"
      sha256 "6bea81fd585f751bd7960f079f829c16f4c751354affb94dc028abdfbe67404c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v7.0.0/agx-7.0.0-darwin-x64.tar.gz"
      sha256 "3168415df5a5e51bf3c7a5223eef15ff6434e462ce23e03947245574fbaf2bc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v7.0.0/agx-7.0.0-linux-arm64.tar.gz"
      sha256 "73c8848d95538f90802543f42cd0e4cbe31b0e873ee0bdd35e3ff6a64d34d205"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v7.0.0/agx-7.0.0-linux-x64.tar.gz"
      sha256 "460be38d9f253d3b7e63a4217285ec1364529ee28c51d56065aef930bbb34029"
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
