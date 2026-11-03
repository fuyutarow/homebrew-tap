class Agx < Formula
  version "1.22.74"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.74/agx-1.22.74-darwin-arm64.tar.gz"
      sha256 "bd9760b2ccff8a1516141d31df9b75647badd94f63eb3493976542fae07752b3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.74/agx-1.22.74-darwin-x64.tar.gz"
      sha256 "909ecb34205d512550460a7c04ac1e7532b9948aae3f40e550d76b865a29143b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.74/agx-1.22.74-linux-arm64.tar.gz"
      sha256 "d8cbc5412949a3a2bd6b85d8a2f6810367ebf24822598a6ba26f6f63f898121d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.74/agx-1.22.74-linux-x64.tar.gz"
      sha256 "e13f9c396a5300b739defcab11842c5e78caae69ee34568c07742238a09f778b"
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
