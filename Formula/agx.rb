class Agx < Formula
  version "10.2.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.1/agx-10.2.1-darwin-arm64.tar.gz"
      sha256 "6b9e4ddd9b1bcf279fb2537068a2c7c2863ccd1872d766991d505c367174dc63"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.1/agx-10.2.1-darwin-x64.tar.gz"
      sha256 "5d9c7df9db8c1a793ea8c1ce5a2a9dec62987550797f554d4ee335c71e62c838"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.1/agx-10.2.1-linux-arm64.tar.gz"
      sha256 "dce8566f3487eb0817ca207c47f2fb1453eb5ac8a4318c1f4abe1ba2fb92bf54"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.2.1/agx-10.2.1-linux-x64.tar.gz"
      sha256 "33a2ef591e65362240f234cb843a668fb2191eb940d5d83d2c69e2447a34df09"
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
