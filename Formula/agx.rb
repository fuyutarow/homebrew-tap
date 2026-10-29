class Agx < Formula
  version "1.22.25"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.25/agx-1.22.25-darwin-arm64.tar.gz"
      sha256 "6db7ecfeb828a4de5f8ed2caaca09757dd2cb5a1f352b563af680efe0150dbc0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.25/agx-1.22.25-darwin-x64.tar.gz"
      sha256 "cba159f4c8ca658692924f2509a424690b84cbb9532c358c01dd262f07cd0220"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.25/agx-1.22.25-linux-arm64.tar.gz"
      sha256 "e41fe71c3e90cbe0fd077bcef5db01d7f3d2869ecca946f7e3829e5d1d1a52e4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.25/agx-1.22.25-linux-x64.tar.gz"
      sha256 "8a27a485ea13ecce77853f70bc9446358030fa43a3bc00a583528f880948556c"
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
