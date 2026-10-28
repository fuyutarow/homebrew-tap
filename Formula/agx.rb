class Agx < Formula
  version "1.20.8"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.8/agx-1.20.8-darwin-arm64.tar.gz"
      sha256 "0032409111b22ed666696bbd34467c6047965db838aa5869686c400508101ca9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.8/agx-1.20.8-darwin-x64.tar.gz"
      sha256 "8cd51a2f7e1abf17ec2aa6b6d18627dbbdff00365b1e75354a5996ca5eabc58c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.8/agx-1.20.8-linux-arm64.tar.gz"
      sha256 "9b9f458e1e5e93eff584b6207bf549d81fe64d1daa40afa6f677dba0950b8a9e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.8/agx-1.20.8-linux-x64.tar.gz"
      sha256 "599b9bed28ef66356b52fa969ab30c46369b4417de5f39fb9db8f95178b24356"
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
