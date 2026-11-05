class Agx < Formula
  version "1.22.105"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.105/agx-1.22.105-darwin-arm64.tar.gz"
      sha256 "249e6de8eaccafca8f872550545e7a8356cca9f49fecb9016d84a88ab703b127"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.105/agx-1.22.105-darwin-x64.tar.gz"
      sha256 "cf5637fbcd4ab00391ed11d5951117181ba0a10f67221a456e08a996ccb2e214"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.105/agx-1.22.105-linux-arm64.tar.gz"
      sha256 "f45bad6bf1f0583790cfb1acf50cb1b9eae7a2814363ddbb91a55961826b33d4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.105/agx-1.22.105-linux-x64.tar.gz"
      sha256 "31121615a79bb8f36eabff92cabb8f98f874aaa70f66617e321d61b5b55da2dd"
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
